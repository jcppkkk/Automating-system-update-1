#!/bin/bash

# Ubuntu Update
echo "============================================="
echo "Starting update the ubuntu security update..."
echo "============================================="
dpkg -i ubuntu/package/*.deb

# change the Gemfile and requirements.txt
cp python/requirements.txt /opt/project-python
cp -r python/offline_packages /opt/project-python

cp ruby/Gemfile /opt/project-ruby
cp ruby/Gemfile.lock /opt/project-ruby
cp -r ruby/vendor /opt/project-ruby

# python - update the requirements.txt
echo "============================================="
echo "Starting update the python project..."
echo "============================================="
cd /opt/project-python && pip install --no-index --find-links="/opt/project-python/offline_packages" -r requirements.txt

# ruby - update the Gemfile
echo "============================================="
echo "Starting update the ruby project..."
echo "============================================="
cd /opt/project-ruby && bundle install --local

echo "done"
