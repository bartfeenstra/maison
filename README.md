# Maison

[![Build Status](https://travis-ci.org/bartfeenstra/maison.svg?branch=master)](https://travis-ci.org/bartfeenstra/maison)

# User data
User dat is stored in `./data` and can be backed up. Data for specific services can be found at `./data/services/*`.

# HTTP Basic Auth
Web applications can be protected using a shared user list, stored at `./data/services/web/htpasswd`. To administer
users, you need the `htpasswd ` utility, found in the `apache2-tools` (APT), `httpd-tools` (YUM), or `apache2-utils`
(APK) packages.
