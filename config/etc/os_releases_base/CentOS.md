CentOS
======

CentOS 7
--------

### /etc/os-release

```
NAME="CentOS Linux"                                                                                                        
VERSION="7 (Core)"
ID="centos"
ID_LIKE="rhel fedora"
VERSION_ID="7"
PRETTY_NAME="CentOS Linux 7 (Core)"
ANSI_COLOR="0;31"
CPE_NAME="cpe:/o:centos:centos:7"
HOME_URL="https://www.centos.org/"
BUG_REPORT_URL="https://bugs.centos.org/"

CENTOS_MANTISBT_PROJECT="CentOS-7"
CENTOS_MANTISBT_PROJECT_VERSION="7"
REDHAT_SUPPORT_PRODUCT="centos"
REDHAT_SUPPORT_PRODUCT_VERSION="7"

```

### lsb-release -a

`lsb_release` is not installed as part of a base system, but is available in the `redhat-lsb-core` package.

```
Distributor ID:	CentOS
Description:	CentOS Linux release 7.1.1503 (Core) 
Release:	7.1.1503
Codename:	Core
```

### /etc/lsb-release

Does not exist

### Distro-specific files

*/etc/centos-release*:

```
CentOS Linux release 7.1.1503 (Core) 
```

`/etc/redhat-release` and `/etc/system-release` are symlinks to `/etc/centos-release`.

### get_platforms()

```
['linux_x86_64_centos_7', 'linux_x86_64', 'any']
```

CentOS 6
--------

### /etc/os-release

Does not exist

### lsb-release -a

`lsb_release` is not installed as part of a base system, but is available in the `redhat-lsb-core` package.

```
Distributor ID:	CentOS
Description:	CentOS release 6.7 (Final)
Release:	6.7
Codename:	Final
```

### /etc/lsb-release

```
LSB_VERSION=base-4.0-amd64:base-4.0-noarch:core-4.0-amd64:core-4.0-noarch
```

### Distro-specific files

*/etc/centos-release*:

```
CentOS release 6.7 (Final)
```

`/etc/redhat-release` and `/etc/system-release` are symlinks to `/etc/centos-release`.

### get_platforms()

With `lsb_release` installed:

```
['linux_x86_64_centos_6_7', 'linux_x86_64_centos_6', 'linux_x86_64', 'any']
```

Without:

```
['linux_x86_64_centos_6_7', 'linux_x86_64_centos_6', 'linux_x86_64', 'any']
```

CentOS 5
--------

### /etc/os-release

Does not exist

### lsb-release -a

`lsb_release` is not installed as part of a base system, but is available in the `redhat-lsb` package.

```
Distributor ID:	CentOS
Description:	CentOS release 5.11 (Final)
Release:	5.11
Codename:	Final
```

### /etc/lsb-release

Does not exist

### Distro-specific files

*/etc/redhat-release*:

```
CentOS release 5.11 (Final)
```

### get_platforms()

With `lsb_release` installed:

```
['linux_x86_64_centos_5_11', 'linux_x86_64_centos_5', 'linux_x86_64', 'any']
```

Without:

```
['linux_x86_64_centos_5_11', 'linux_x86_64_centos_5', 'linux_x86_64', 'any']
```