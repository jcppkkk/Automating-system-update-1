#!/bin/bash

#current="$(pwd)"
rb_path="/opt/project-ruby"
py_path="/opt/project-python"

mkdir /tmp/auto_update
mkdir /tmp/auto_update/python
mkdir /tmp/auto_update/python/offline_packages
mkdir /tmp/auto_update/ruby
mkdir /tmp/auto_update/ubuntu
mkdir /tmp/auto_update/ubuntu/package

# Ubuntu Update
echo "============================================="
echo "Starting packed the ubuntu security update..."
echo "============================================="
apt update
apt install -y apt-offline
apt install -y zip

unattended-upgrade --dry-run -v > update_file
update_file=$(grep "Packages that will be upgraded: " update_file | awk -F"Packages that will be upgraded: " '{print $2}')
apt-offline set --install-package $update_file imagemagick libmagickwand-dev -- pkgs.sig
apt-offline get ./pkgs.sig --threads 2 --bundle pkgs.zip
mv pkgs.zip /tmp/auto_update/ubuntu/package 
cd /tmp/auto_update/ubuntu/package && unzip pkgs.zip

# python - update the requirements.txt
echo "============================================="
echo "Starting generate the python package..."
echo "============================================="

cd $py_path && pip install --download /tmp/auto_update/python/offline_packages -r requirements.txt
cp $py_path/requirements.txt /tmp/auto_update/python

# ruby - update the Gemfile
echo "============================================="
echo "Starting gererate the ruby update pack..."
echo "============================================="

cd $rb_path 
rm -rf .bundle/ && bundle package --all --all-platforms
cp -r $rb_path/vendor /tmp/auto_update/ruby
cp $rb_path/Gemfile /tmp/auto_update/ruby


echo "Done." 
echo "The update pack is in the /tmp/auto_update"
