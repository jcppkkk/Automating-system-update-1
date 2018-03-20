#!/bin/bash

current="$(pwd)"
rb_path="/opt/project-ruby"
py_path="/opt/project-python"

# Ubuntu Update
echo "=================================================="
echo "Starting generate the ubuntu package and update..."
echo "=================================================="

sudo apt-offline get ubuntu/pkgs.sig --threads 2 --bundle pkgs.zip
unzip pkgs.zip && mv *.deb /tmp/auto_update/ubuntu/package

# python - update the requirements.txt
echo "=================================================="
echo "Starting generate the python package and update..."
echo "=================================================="

cd $py_path && pip install --download /tmp/auto_update/python/offline_packages -r requirements.txt

# ruby - update the Gemfile
echo "===================================================="
echo "Starting gererate the ruby update pack and update..."
echo "===================================================="

cd $rb_path 
bundle install --local
cp -r $rb_path/vendor /tmp/auto_update/ruby
cp $rb_path/Gemfile /tmp/auto_update/ruby

