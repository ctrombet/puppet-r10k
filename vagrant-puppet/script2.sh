#!/bin/bash

echo "Configuring and Starting Puppet"

sudo mv /tmp/puppet.conf /etc/puppet
sudo mv /tmp/hiera.yaml /etc/puppet
#sudo mv /tmp/puppetserver /etc/sysconfig/puppetserver

# Start Puppet Master and Agent

echo "Starting Puppet Master and waiting to be ready"
sudo systemctl start puppetserver

echo "Now starting puppet agent"

echo "To apply the new change run"
echo "/usr/bin/ruby /usr/bin/puppet agent --test"

echo "Configure the services to start automatically on boot"

chkconfig puppet on
chkconfig puppetserver on