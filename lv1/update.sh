#!/bin/bash

# Ubuntu Update
echo "Starting update the ubuntu security update..."
apt update
unattended-upgrade --dry-run -d
echo "done for ubuntu update"

# change the Gemfile and requirements.txt
cp python/requirements.txt /opt/project-python
cp ruby/Gemfile /opt/project-ruby
cp ruby/Gemfile.lock /opt/project-ruby
cp -r ruby/vendor /opt/project-ruby

# python - update the requirements.txt
echo "Starting update the python project..."
cd /opt/project-python && pip install -r requirements.txt

# ruby - update the Gemfile
echo "Starting update the ruby project..."
apt install -y imagemagick libmagickwand-dev
cd /opt/project-ruby && bundle install --local

echo "done"
