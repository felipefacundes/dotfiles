openSUSE
========

openSUSE Tumbleweed
-------------------

As of 2014-08-25

### /etc/os-release

```
NAME=openSUSE
VERSION="20150725 (Tumbleweed)"
VERSION_ID="20150725"
PRETTY_NAME="openSUSE 20150725 (Tumbleweed) (x86_64)"
ID=opensuse
ANSI_COLOR="0;32"
CPE_NAME="cpe:/o:opensuse:opensuse:20150725"
BUG_REPORT_URL="https://bugs.opensuse.org"
HOME_URL="https://opensuse.org/"
ID_LIKE="suse"
```

### lsb_release -a

`lsb_release` is not installed as part of a base system, but is available in the `lsb-release` package. It's worth noting that `lsb_release` on modern versions of openSUSE just read from `/etc/os-release`.

```
Distributor ID:	openSUSE project
Description:	openSUSE 20150725 (Tumbleweed) (x86_64)
Release:	20150725
Codename:	n/a
```
### /etc/lsb-release

Does not exist

### Distro-specific files

*/etc/SuSE-release*:

```
openSUSE 20150725 (x86_64)
VERSION = 20150725
CODENAME = Tumbleweed
# /etc/SuSE-release is deprecated and will be removed in the future, use /etc/os-release instead
```

### get_platforms()

Tested via all three paths:

```
['linux_x86_64_opensuse_20150725', 'linux_x86_64', 'any']
```

openSUSE 13.2
-------------

### /etc/os-release

Per the [SLES 11 Release Notes](https://www.suse.com/releasenotes/x86_64/SUSE-SLES/11-SP4/), it was added in SLES 11, which I assume means it should also be in openSUSE 11+

```
NAME=openSUSE
VERSION="13.2 (Harlequin)"
VERSION_ID="13.2"
PRETTY_NAME="openSUSE 13.2 (Harlequin) (x86_64)"
ID=opensuse
ANSI_COLOR="0;32"
CPE_NAME="cpe:/o:opensuse:opensuse:13.2"
BUG_REPORT_URL="https://bugs.opensuse.org"
HOME_URL="https://opensuse.org/"
ID_LIKE="suse"
```

### lsb_release -a

`lsb_release` is not installed as part of a base system, but is available in the `lsb-release` package.

```
Distributor ID:	openSUSE project
Description:	openSUSE 13.2 (Harlequin) (x86_64)
Release:	13.2
Codename:	Harlequin
```

### /etc/lsb-release

Does not exist

### Distro-specific files

*/etc/SuSE-release*:

```
openSUSE 13.2 (x86_64)
VERSION = 13.2
CODENAME = Harlequin
# /etc/SuSE-release is deprecated and will be removed in the future, use /etc/os-release instead
```

### get_platforms()

Tested via all three paths:

```
['linux_x86_64_opensuse_13_2', 'linux_x86_64_opensuse_13', 'linux_x86_64', 'any']
```