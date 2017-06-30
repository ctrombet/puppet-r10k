#!/bin/bash

echo "Vagrant provisioning"

echo "Creating all the folders required"

mkdir -p /vagrant/environments/dev/enc  /vagrant/environments/dev/hieradata /vagrant/environments/dev/modules/test/manifests
mkdir -p /vagrant/environments/dev/modules/profile/manifests /vagrant/environments/dev/modules/role/manifests
mkdir -p /vagrant/artifacts

## Update all and install EPEL repo for extra packages

yum -y update
#yum install -y epel-release

rpm -ivh https://yum.puppetlabs.com/el/7/products/x86_64/puppetlabs-release-7-12.noarch.rpm

## Install Puppet Agent and Server

yum -y update 
yum install -y puppet puppetserver


# Install some extra utilities
yum install -y curl vim nano wget lynx git python2.7 python-pip curl


# Install NGIX to store artifacts to download

yum install -y nginx

# Create a artifacts folder where they can be downloaded

cd /usr/share/nginx/html && ln -s /vagrant/artifacts artifacts

## Important: disable SELinux to allow Nginx to load folder outside it's default'

sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

# Start Nginx
sudo service nginx start

# Enable it at restart
chkconfig nginx on

echo "Environment provisioned"



