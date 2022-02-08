FROM amazonlinux:latest

RUN yum -y install which unzip aws-cli wget jq
WORKDIR /tmp
USER root


ARG release=18
ARG update=3

RUN  cd /etc/yum.repos.d && wget http://yum.oracle.com/public-yum-ol7.repo && \
     wget http://public-yum.oracle.com/RPM-GPG-KEY-oracle-ol7 -O /etc/pki/rpm-gpg/RPM-GPG-KEY-oracle


RUN  yum -y install oracle-release-el7 && yum-config-manager --enable ol7_oracle_instantclient && \
     yum -y install oracle-instantclient${release}.${update}-basic.x86_64 && yum -y install oracle-instantclient${release}.${update}-devel.x86_64 && yum -y install oracle-instantclient${release}.${update}-sqlplus.x86_64 && \
     rm -rf /var/cache/yum

ADD Linux_fetch_run.sh /usr/local/bin/Linux_fetch_run.sh
WORKDIR /tmp
USER root

ENV ORACLE_HOME /usr/lib/oracle/${release}.${update}/client64
ENV PATH $ORACLE_HOME/bin:$PATH
ENV LD_LIBRARY_PATH $ORACLE_HOME/lib:$ORACLE_HOME

ENTRYPOINT ["/bin/sh","/usr/local/bin/Linux_fetch_run.sh"]
