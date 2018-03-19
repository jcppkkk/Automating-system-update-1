#!/bin/bash

# Ubuntu Update
echo "Starting update the ubuntu security update..."
apt update
apt upgrade -y ca-certificates curl libasn1-8-heimdal libc-bin libcurl3 libcurl3-gnutls libcurl4-openssl-dev libdb5.3 libgcrypt20 libgnutls30 libgssapi3-heimdal libhcrypto4-heimdal libheimbase1-heimdal libheimntlm0-heimdal libhx509-5-heimdal libidn11 libkrb5-26-heimdal libldap-2.4-2 libpam-doc libpython3.5-minimal libpython3.5-stdlib libroken18-heimdal libsystemd0 libtasn1-6 libudev1 libwind0-heimdal locales multiarch-support openssh-client openssh-server openssh-sftp-server openssl python3.5 python3.5-minimal sensible-utils systemd systemd-sysv
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
