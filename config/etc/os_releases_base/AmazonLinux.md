Amazon Linux
============

Amazon Linux 2016.09
--------------------

### /etc/os-release

```
NAME="Amazon Linux AMI"
VERSION="2016.09"
ID="amzn"
ID_LIKE="rhel fedora"
VERSION_ID="2016.09"
PRETTY_NAME="Amazon Linux AMI 2016.09"
ANSI_COLOR="0;33"
CPE_NAME="cpe:/o:amazon:linux:2016.09:ga"
HOME_URL="http://aws.amazon.com/amazon-linux-ami/"
```

### lsb-release -a

`lsb_release` is not installed as part of a base system, but is available in the `redhat-lsb-core` package.

```
LSB Version:	:base-4.0-amd64:base-4.0-noarch:core-4.0-amd64:core-4.0-noarch
Distributor ID:	AmazonAMI
Description:	Amazon Linux AMI release 2016.09
Release:	2016.09
Codename:	n/a
```

### /etc/lsb-release

Does not exist

### Distro-specific files

*/etc/system-release*:

```
Amazon Linux AMI release 2016.09
```

### get_specific_platform()

```
SpecificPlatform(dist='amzn', major_vers='2016.09', full_vers='2016.09', stability='stable')
```