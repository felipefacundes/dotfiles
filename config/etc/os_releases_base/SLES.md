SLES
====

**I have not verified this information on a SLES install, I gathered the information from the web.**

SLES
----

### /etc/os-release

Per the [SLES 11 Release Notes](https://www.suse.com/releasenotes/x86_64/SUSE-SLES/11-SP4/), it was added in SLES 11.

Contents for 12 from [saltstack/salt#24019](https://github.com/saltstack/salt/issues/24019):

```
NAME="SLES"
VERSION="12"
VERSION_ID="12"
PRETTY_NAME="SUSE Linux Enterprise Server 12"
ID="sles"
ANSI_COLOR="0;32"
CPE_NAME="cpe:/o:suse:sles:12"
```

### lsb_release -a

I do not know if `lsb_release` is part of the base system. It is available from the [lsb-release](https://www.suse.com/LinuxPackages/packageRouter.jsp?product=server&version=11&service_pack=sp1&architecture=i386&package_name=lsb-release) package.

Again from salt#24019:

```
Distributor ID:     SUSE LINUX
Description:        SUSE Linux Enterprise Server 12
Release:    12
Codename:   12
```

### /etc/lsb-release

???

### Distro-specific files

*/etc/SuSE-release*:

Again from salt#24019:

```
SUSE Linux Enterprise Server 12 (x86_64)
VERSION = 12
PATCHLEVEL = 0
# This file is deprecated and will be removed in a future service pack or release.
# Please check /etc/os-release for details about this release.
```

### get_platforms()

Untested, on 12 it should be:

```
['linux_x86_64_sles_12', 'linux_x86_64', 'any']
```