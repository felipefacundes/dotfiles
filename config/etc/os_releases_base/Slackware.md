Slackware
=========

Slackware 14.1
--------------

### /etc/os-release

From this thread on [Slackware's linuxquestions.org forum](http://www.linuxquestions.org/questions/slackware-14/any-chance-of-slackware-including-etc-os-release-4175423210/), it's included since Slackware 14.0

```
NAME=Slackware
VERSION="14.1"
ID=slackware
VERSION_ID=14.1
PRETTY_NAME="Slackware 14.1"
ANSI_COLOR="0;34"
CPE_NAME="cpe:/o:slackware:slackware_linux:14.1"
HOME_URL="http://slackware.com/"
SUPPORT_URL="http://www.linuxquestions.org/questions/slackware-14/"
BUG_REPORT_URL="http://www.linuxquestions.org/questions/slackware-14/"
```

### lsb_release -a

It is not installed on (at least) a base Slackware 14.1 system. I do not know if it's available.

### /etc/lsb-release

Does not exist

### Distro-specific files

*/etc/slackware-version*:

```
Slackware 14.1

```

### get_platforms()

**Untested**, on 14.1 it should be:

```
['linux_x86_64_slackware_14_1', 'linux_x86_64_slackware_14', 'linux_x86_64', 'any']
```

Slackware 13.37
--------------

### /etc/os-release

Does not exist

### lsb_release -a

It is not installed on (at least) a base Slackware 13.37 system. I do not know if it's available.

### /etc/lsb-release

Does not exist

### Distro-specific files

*/etc/slackware-version*:

```
Slackware 13.37.0

```

### get_platforms()

**Untested**, on 13.37 it should be:

```
['linux_x86_64_slackware_13_37_0', 'linux_x86_64_slackware_13', 'linux_x86_64', 'any']
```