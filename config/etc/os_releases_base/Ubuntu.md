Ubuntu
======

Ubuntu 14.04 (trusty)
---------------------

### /etc/os-release

```
NAME="Ubuntu"
VERSION="14.04, Trusty Tahr"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 14.04 LTS"
VERSION_ID="14.04"
HOME_URL="http://www.ubuntu.com/"
SUPPORT_URL="http://help.ubuntu.com/"
BUG_REPORT_URL="http://bugs.launchpad.net/ubuntu/"
```

### lsb-release -a

`lsb_release` is installed as part of a base system, via the `lsb-release` package.

```
Distributor ID:	Ubuntu
Description:	Ubuntu 14.04 LTS
Release:	14.04
Codename:	trusty
```

### /etc/lsb-release


```
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=14.04
DISTRIB_CODENAME=trusty
DISTRIB_DESCRIPTION="Ubuntu 14.04 LTS"
```

### Distro-specific files

*/etc/debian_version*:

```
jessie/sid
```

### get_platforms()

```
['linux_x86_64_ubuntu_14_04', 'linux_x86_64', 'any']
```

Ubuntu 12.04 (precise)
----------------------

### /etc/os-release

Does not exist

### lsb-release -a

`lsb_release` is installed as part of a base system, via the `lsb-release` package.

```
Distributor ID:	Ubuntu
Description:	Ubuntu 12.04 LTS
Release:	12.04
Codename:	precise
```

### /etc/lsb-release

```
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=12.04
DISTRIB_CODENAME=precise
DISTRIB_DESCRIPTION="Ubuntu 12.04 LTS"
```

### Distro-specific files

*/etc/debian_version*:

```
wheezy/sid
```

### get_platforms()

```
['linux_x86_64_ubuntu_12_04', 'linux_x86_64', 'any']
```