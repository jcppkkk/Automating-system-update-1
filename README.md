# Automating-system-update

## Target 

- Levels
  - Level 1: Manually prepare (A)
  - Level 2: Manually prepare (B)
  - Level 3: Write (C)
  - Level 4: Auto build -- (C)+(D)
  - Level 5: Auto build & test -- (C)+(D)+(E)

- Objectives
  - (A) A update pack that can update the product with Internet
  - (B) A update pack that can update the product **without Internet**
    - The size of update pack needs to be as small as possible, maximum 500MB
    - The update pack should be able to execute on the server
  - (C) A script that can generate (B) with lastest updates
    - For security updates, the update content need to be fresh (which can update system packages to the time it generated)
    - e.g. If (B) is generated at 2018/03/14, it should contains following updates: \`ca-certificates libasn1-8-heimdal libc-bin libdb5.3 libgcrypt20 libgnutls30 libgssapi3-heimdal libhcrypto4-heimdal libheimbase1-heimdal libheimntlm0-heimdal libhx509-5-heimdal libidn11 libkrb5-26-heimdal libldap-2.4-2 libpam-doc libpython3.5-minimal libpython3.5-stdlib libroken18-heimdal libsystemd0 libtasn1-6 libudev1 libwind0-heimdal locales multiarch-support openssh-client openssh-server openssh-sftp-server openssl python3.5 python3.5-minimal sensible-utils systemd systemd-sysv\`
  - (D) Auto generate (B) with (C) after commit pushed
    - Setup CI with a online CI service (gitlab-ci, Travis, circleci, Buddy...etc)
  - (E) Auto test that (B) can be applied in docker image correctly after commit pushed
    - **Try to isolate Internat access of the docker container under test** when apply (B)

## Current progress

- Levels
  - [Done] Level 1: Manually prepare
  - Level 2: Manually prepare
  - Level 3: Write
  - Level 4: Auto build
  - Level 5: Auto build & test

### Level 1
將 `lv1/update.sh` 放進 docker 裡面直接執行即可

### Level 2
將 `lv2` 整個資料夾放進 docker 裡面

```
cd lv2
./update_with_no_internet.sh
```
