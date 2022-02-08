## Packer ##
Packer can build machine images for a number of different platforms.  We will focus on the amazon-ebs builder, which will create an EBS-backed AMI. 
At a high level, Packer performs these steps:

Read configuration settings from a json file
Uses the AWS API to stand up an EC2 instance
Connect to the instance and provision it
Shut down and snapshot the instance
Create an Amazon Machine Image (AMI) from the snapshot
Clean up the mess
The amazon-ebs builder can create temporary keypairs, security group rules, and establish a basic communicator for provisioning. 
However, in the interest of tighter security and control, 
we will want to be prescriptive for some of these settings and use a secure communicator to reduce the risk of eavesdropping while we provision the machine.

# packer-build-windows-ami
Windows AMI Creation with Packer

#There are two main section above which are builders and provisioners.
Builders are responsible for creating machines and generating images from them for various platforms. For example, there are separate builders for EC2, VMware, VirtualBox, etc. Packer comes with many builders by default, and can also be extended to add new builders. In the Windows I am using Amazon EC2 because currently we use AWS as a cloud provider.
Provisioners use builtin and third-party software to install and configure the machine image after booting. Provisioners prepare the system for use, so common use cases for provisioners include:


## Objective ##
* Build Windows AMI using Packer and provision software

## Prerequisites
* Packer is installed
* Understand JSON file structure
* Knowledge about environment variables
* Basics of powershell

Packer is a tool for creating identical machine images for multiple platforms from a single source configuration. What is [packer](https://www.packer.io/intro/)? How to [install](https://www.packer.io/intro/getting-started/install.html)? Learn Packer [template](https://www.packer.io/docs/templates/index.html).

## File Structure
| File Name                     | Purpose                                                        |
| -------------                 |:-------------                                                  |
| base_ami.json                 | A JSON file which is used by Packer to build Windows based AMI |
| variables.json                | Variables file which are used in Packer template               |
| scripts/ec2-userdata.ps1      | PowerShell script in order to setup WinRM connection           |
| scripts.ps1                   | This provisioner scripts which read S3 bucket                  |

## Building Packer
In order to compile there are some options for Packer. If you want to build just type:

```
packer build -var-file=variables.json base_ami.json
```

There is also option which you can start in DEBUG mode.

```
packer build -debug -var-file= variables.json base_ami.json
```

The ```packer validate``` command allows you to validate check that a template is valid.

``
packer validate -var-file= variables.json base_ami.json
```
