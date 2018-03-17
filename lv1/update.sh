#!/bin/bash

# Ubuntu Update
echo "Starting update the ubuntu security update..."
apt update
unattended-upgrade --dry-run -d
echo "done for ubuntu update"

# download the update file
curl -O https://raw.githubusercontent.com/jcppkkk/Automating-system-update/ce822ca4eb0c286a8c0459b8e4f9e7a7fc70becc/v2/Gemfile
curl -O https://raw.githubusercontent.com/jcppkkk/Automating-system-update/ce822ca4eb0c286a8c0459b8e4f9e7a7fc70becc/v2/requirements.txt

# python - update the requirements.txt
mv requirements.txt /opt/project-python
echo "Starting update the python project..."
cd /opt/project-python && pip install -r requirements.txt

# ruby - update the Gemfile
mv Gemfile /opt/project-ruby
echo "Starting update the ruby project..."
cd /opt/project-ruby && bundle install

echo "done"
