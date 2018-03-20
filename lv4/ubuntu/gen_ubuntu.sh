#!/bin/bash
update_file=$(grep "Packages that will be upgraded: " update_file | awk -F"Packages that will be upgraded: " '{print $2}')
apt-offline set --install-package $update_file -- pkgs.sig
