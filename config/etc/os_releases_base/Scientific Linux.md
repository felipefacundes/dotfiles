Scientific Linux
================

Scientific Linux 7
------------------

### /etc/os-release

```
NAME="Scientific Linux"
VERSION="7.1 (Nitrogen)"
ID="rhel"
ID_LIKE="fedora"
VERSION_ID="7.1"
PRETTY_NAME="Scientific Linux 7.1 (Nitrogen)"
ANSI_COLOR="0;31"
CPE_NAME="cpe:/o:redhat:enterprise_linux:7.1:GA"
HOME_URL="http://www.scientificlinux.org//"
BUG_REPORT_URL="scientific-linux-devel@listserv.fnal.gov"

REDHAT_BUGZILLA_PRODUCT="Scientific Linux 7"
REDHAT_BUGZILLA_PRODUCT_VERSION=7.1
REDHAT_SUPPORT_PRODUCT="Scientific Linux"
REDHAT_SUPPORT_PRODUCT_VERSION=7.1
```

### lsb-release -a

`lsb_release` is not installed as part of a base system, but is available in the `redhat-lsb-core` package.

```
LSB Version:	:core-4.1-amd64:core-4.1-noarch
Distributor ID:	Scientific
Description:	Scientific Linux release 7.1 (Nitrogen)
Release:	7.1
Codename:	Nitrogen
```

### /etc/lsb-release

Does not exist

### Distro-specific files

*/etc/redhat-release*:

```
Scientific Linux release 7.1 (Nitrogen)
```

`/etc/sl-release` and `/etc/system-release` are symlinks to `/etc/redhat-release`.

### get_platforms()

```
['linux_x86_64_rhel_7_1', 'linux_x86_64_rhel_7', 'linux_x86_64', 'any']
```

Scientific Linux 6
------------------

### /etc/os-release

Does not exist

### lsb-release -a

`lsb_release` is not installed as part of a base system, but is available in the `redhat-lsb-core` package.

```
LSB Version:	:base-4.0-amd64:base-4.0-noarch:core-4.0-amd64:core-4.0-noarch
Distributor ID:	Scientific
Description:	Scientific Linux release 6.7 (Carbon)
Release:	6.7
Codename:	Carbon
```

### /etc/lsb-release

```
LSB_VERSION=base-4.0-amd64:base-4.0-noarch:core-4.0-amd64:core-4.0-noarch
```

### Distro-specific files

*/etc/redhat-release*:

```
Scientific Linux release 6.7 (Carbon)
```

`/etc/system-release` is a symlink to `/etc/redhat-release`.

### get_platforms()

Both with and without `lsb_release` installed:

```
['linux_x86_64_scientific_6_7', 'linux_x86_64_scientific_6', 'linux_x86_64', 'any']
```