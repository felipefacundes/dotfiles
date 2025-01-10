Fedora
======

Fedora 22
---------

### /etc/os-release

```
NAME=Fedora
VERSION="22 (Twenty Two)"
ID=fedora
VERSION_ID=22
PRETTY_NAME="Fedora 22 (Twenty Two)"
ANSI_COLOR="0;34"
CPE_NAME="cpe:/o:fedoraproject:fedora:22"
HOME_URL="https://fedoraproject.org/"
BUG_REPORT_URL="https://bugzilla.redhat.com/"
REDHAT_BUGZILLA_PRODUCT="Fedora"
REDHAT_BUGZILLA_PRODUCT_VERSION=22
REDHAT_SUPPORT_PRODUCT="Fedora"
REDHAT_SUPPORT_PRODUCT_VERSION=22
PRIVACY_POLICY_URL=https://fedoraproject.org/wiki/Legal:PrivacyPolicy
```

### lsb-release -a

`lsb_release` is not installed as part of a base system, but is available in the `redhat-lsb-core` package.

```
Distributor ID:	Fedora
Description:	Fedora release 22 (Twenty Two)
Release:	22
Codename:	TwentyTwo
```

### /etc/lsb-release

Does not exist

### Distro-specific files

*/etc/fedora-release*:

```
Fedora release 22 (Twenty Two)
```

`/etc/redhat-release` and `/etc/system-release` are symlinks to `/etc/fedora-release`.

### get_platforms()

Tested through all 3 paths:

```
['linux_x86_64_fedora_22', 'linux_x86_64', 'any']
```