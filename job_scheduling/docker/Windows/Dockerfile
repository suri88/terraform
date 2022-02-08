FROM amazonlinux:latest

RUN yum -y install which unzip aws-cli wget curl wq


RUN curl https://packages.microsoft.com/config/rhel/7/prod.repo | tee /etc/yum.repos.d/microsoft.repo && \
    yum install -y powershell && rm -rf /var/cache/yum


RUN pwsh -Command 'Install-Module -Name SqlServer -Force'

ADD Windows_fetch_run.sh /usr/local/bin/Windows_fetch_run.sh

WORKDIR /tmp
USER root

ENTRYPOINT ["/bin/sh","/usr/local/bin/Windows_fetch_run.sh"]
