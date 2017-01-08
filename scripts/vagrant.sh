#!/bin/sh -e

. /etc/profile.d/proxy.sh
# Set up sudo
echo "%vagrant ALL=NOPASSWD:ALL" > /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant

# Setup sudo to allow no-password sudo for "sudo"
usermod -a -G sudo vagrant

# Installing vagrant keys
mkdir /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
cd /home/vagrant/.ssh
certfile=/tmp/aptcache/vagrant.pub
if test ! -f $certfile; then
  wget --no-check-certificate -O $certfile https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub
fi
cp $certfile authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh
exit 0
