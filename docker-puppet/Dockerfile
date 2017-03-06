FROM centos
MAINTAINER Cristian Trombetta

RUN rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm

RUN yum update -y && yum install -y puppet-agent

RUN /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true

EXPOSE 80
