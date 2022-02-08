import argparse
import sys
import time
import uuid
import boto3
import os, tempfile, zipfile
import yaml
from datetime import datetime
from urllib.parse import unquote_plus
from botocore.compat import total_seconds


# Function to submit job to AWS batch in particular region and other job parameters
def batch_submit_job(region,batch_endpoint_url,jobName,jobQueue,jobDefinition,logGroupName,job_parameters):

    logGroupName = logGroupName    

    batch = boto3.client(service_name='batch',region_name=region,endpoint_url=batch_endpoint_url)
    
    submitJobResponse = batch.submit_job(
        jobName=jobName,
        jobQueue=jobQueue,
        jobDefinition=jobDefinition,
        parameters=job_parameters
        #containerOverrides={'command': command}
    )
    
    jobId = submitJobResponse['jobId']
#    print 'Submitted job [%s - %s] to the job queue [%s]' % (jobName, jobId, jobQueue)

#Handler function of lambda function for S3 triggers
def handler(event, context):
    for record in event['Records']:
        bucket = record['s3']['bucket']['name']
        key = unquote_plus(record['s3']['object']['key'])
        tmpkey = key.replace('/', '')
        download_path = '/tmp/{}{}'.format(uuid.uuid4(), tmpkey)
        print("bucket name " + bucket)
        print("key name " + key)
        print("temp key " + tmpkey)

        
        application,job_archive_name = key.split('/', 1)
        print("application name " + application)
        job_archive_name = job_archive_name.split('.',1)[0]        
        print("job archive name " + job_archive_name) 
        
        #Reading the lambda input file for batch end point url and cloud watch groups
        with open(r'lambda_input.yaml') as stream:
             data = yaml.safe_load(stream)
             batch_endpoint_url = data['batch_endpoint_url']
             batch_cloudwatch_log_group = data['batch_cloudwatch_log_group']
             s3_client = boto3.client(service_name='s3',region_name=data['region'],)
             s3_client.download_file(bucket, key, download_path)
                

        with tempfile.TemporaryDirectory() as tmpdir:
             print('temp dir ' + tmpdir)
             os.chdir(tmpdir)
             
             
             with zipfile.ZipFile(download_path, 'r') as archive:
                 archive.extractall()
        
        
                 #Read the input.yaml file for job parameters like queue,job definition etc.
                 with open(r'input.yaml') as stream:
                     data = yaml.safe_load(stream)
             
                     execution_type = data['execution_type']
                     job_name = data['job_name']
                     job_queue = data['job_queue']
                     job_definition = data['job_definition']
                     region = data['region']
                     
                     print("execution_type " +execution_type )
                     print("job_name " +job_name )
                     print("job_queue " +job_queue )
                     print("job_definition " +job_definition )
                     print("region " +region )

                     job_parameters = {"S3_BUCKET_NAME": bucket,"APPLICATION_NAME": application,"APPLICATION_ZIP_NAME": job_archive_name,"REGION": region}
             
                     if execution_type == 'cron':
                         print('Execution type is cron..so job will not be executed through s3 trigger but through cloudwatch events')
                         exit(0)
                     else:
                         print('Execution type is not cron..so job will be executed through s3 trigger..')                      

             
                     
                     batch_cloudwatch_log_group = batch_cloudwatch_log_group
                     #Calling batch submit job with required parameters
                     batch_submit_job(region,batch_endpoint_url,job_name,job_queue,job_definition,batch_cloudwatch_log_group,job_parameters)              

              
    


   

