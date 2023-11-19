#!/bin/bash -e

a= . install2-init-functions

# add vagrant's public key - user can ssh without password
run_chroot mkdir -pm 700 /home/vagrant/.ssh
run_chroot curl -q -o /home/vagrant/.ssh/authorized_keys https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub
run_chroot chmod 0600 /home/vagrant/.ssh/authorized_keys
run_chroot chown -R vagrant:vagrant /home/vagrant/.ssh

# give sudo access (grants all permissions to user vagrant)
run_chroot echo "vagrant ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/vagrant
run_chroot chmod 0440 /etc/sudoers.d/vagrant