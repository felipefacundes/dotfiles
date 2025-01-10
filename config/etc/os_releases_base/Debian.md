Debian
======

Debian stretch
--------------

### /etc/os-release

Doesn't include a version or version_id, so this results in reading the distro name from `/etc/os-release` but version detection falls through to the "legacy" method of reading from `/etc/debian_version`.

```
PRETTY_NAME="Debian GNU/Linux stretch/sid"
NAME="Debian GNU/Linux"
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support/"
BUG_REPORT_URL="https://bugs.debian.org/"
```

### lsb-release -a

`lsb_release` is not installed as part of a base system, but is available in the `lsb-release` package.

```
Distributor ID:	Debian
Description:	Debian GNU/Linux testing (stretch)
Release:	testing
Codename:	stretch
```

### /etc/lsb-release

Does not exist

### Distro-specific files

*/etc/debian_version*:

```
stretch/sid
```

### get_platforms()

```
['linux_x86_64_debian_stretch_sid', 'linux_x86_64', 'any']
```

Debian 8 (jessie)
-----------------

### /etc/os-release

```
PRETTY_NAME="Debian GNU/Linux 8 (jessie)"
NAME="Debian GNU/Linux"
VERSION_ID="8"
VERSION="8 (jessie)"
ID=debian
HOME_URL="http://www.debian.org/"
SUPPORT_URL="http://www.debian.org/support/"
BUG_REPORT_URL="https://bugs.debian.org/"
```

### lsb-release -a

`lsb_release` is not installed as part of a base system, but is available in the `lsb-release` package.

```
Distributor ID:	Debian
Description:	Debian GNU/Linux 8.1 (jessie)
Release:	8.1
Codename:	jessie
```

### /etc/lsb-release

Does not exist

### Distro-specific files

*/etc/debian_version*:

```
8.1
```

### get_platforms()

```
['linux_x86_64_debian_8', 'linux_x86_64', 'any']
```

Debian 7 (wheezy)
-----------------

### /etc/os-release

```
PRETTY_NAME="Debian GNU/Linux 7 (wheezy)"
NAME="Debian GNU/Linux"
VERSION_ID="7"
VERSION="7 (wheezy)"
ID=debian
ANSI_COLOR="1;31"
HOME_URL="http://www.debian.org/"
SUPPORT_URL="http://www.debian.org/support/"
BUG_REPORT_URL="http://bugs.debian.org/"
```

### lsb-release -a

`lsb_release` is not installed as part of a base system, but is available in the `lsb-release` package.

```
Distributor ID:	Debian
Description:	Debian GNU/Linux 7.8 (wheezy)
Release:	7.8
Codename:	wheezy
```

### /etc/lsb-release

Does not exist

### Distro-specific files

*/etc/debian_version*:

```
7.8
```

### get_platforms()

```
['linux_x86_64_debian_7', 'linux_x86_64', 'any']
```

Debian 6 (squeeze)
------------------

### /etc/os-release

Does not exist

### lsb-release -a

`lsb_release` is not installed as part of a base system, but is available in the `lsb-release` package.

```
Distributor ID:	Debian
Description:	Debian GNU/Linux 6.0.10 (squeeze)
Release:	6.0.10
Codename:	squeeze
```

### /etc/lsb-release

Does not exist

### Distro-specific files

*/etc/debian_version*:

```
6.0.10
```

### get_platforms()

With `lsb_release` installed:

```
['linux_x86_64_debian_6_0_10', 'linux_x86_64_debian_6', 'linux_x86_64', 'any']
```

Without:

```
['linux_x86_64_debian_6_0_10', 'linux_x86_64_debian_6', 'linux_x86_64', 'any']
```