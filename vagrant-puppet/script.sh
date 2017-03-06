#!/bin/bash

echo "Vagrant provisioning"

rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm

rpm -Uvh https://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

yum update -y --skip-broken && yum install -y --skip-broken puppet-agent

/opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true

yum install -y curl wget lynx git python2.7 python-pip

pip install awscli


echo "Environment provisioned"



