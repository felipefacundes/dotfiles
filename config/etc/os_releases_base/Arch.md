Arch
====

**I have not verified this information on an Arch install, I gathered the information from the web.**

Arch
----

### /etc/os-release

Via the [filesystem package](https://projects.archlinux.org/svntogit/packages.git/tree/trunk/os-release?h=packages/filesystem)

```
NAME="Arch Linux"
ID=arch
PRETTY_NAME="Arch Linux"
ANSI_COLOR="0;36"
HOME_URL="https://www.archlinux.org/"
SUPPORT_URL="https://bbs.archlinux.org/"
BUG_REPORT_URL="https://bugs.archlinux.org/"
```

### lsb-release -a

`lsb_release` is not installed as part of the base system, but is available in the [lsb-release](https://www.archlinux.org/packages/community/any/lsb-release/) package.

Just guessing based on looking at the package source:

```
Distributor ID:	Arch
Description:	Arch Linux
Release:	rolling
Codename:	????
```

### /etc/lsb-release

/etc/lsb-release is installed with the `lsb-release` package. I believe these would be its contents:

```
LSB_VERSION=1.4-14
DISTRIB_ID=Arch
DISTRIB_RELEASE=rolling
DISTRIB_DESCRIPTION="Arch Linux"
```

### Distro-specific files

*/etc/arch-version*:

It is an empty file, but its existence indicates that the distro is Arch.

### get_platforms()

Untested, should be:

```
['linux_x86_64_arch_rolling', 'linux_x86_64', 'any']
```