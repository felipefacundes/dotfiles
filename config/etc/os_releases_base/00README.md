Distribution Detection
======================

I am working on adding support for building and distributing (via PyPI) Python Wheels with C Extensions to the Python [wheel](https://wheel.readthedocs.org/) and [pip](https://pip.pypa.io/) packages. The discussion on Distutils-SIG continues, but I believe it is fairly certain that some [effort to correctly identify Linux distributions will need to be made](https://mail.python.org/pipermail/distutils-sig/2015-August/026719.html). I've begun [efforts to add this support to wheel](https://bitbucket.org/natefoo/wheel/src/tip/wheel/platform/linux.py).

## How you can help

If you have a Linux distribution or version of a listed distribution not in this gist, or one of the ones I have not directly verified, I could use the following:

- The contents of `/etc/os-release`, if it exists
- Whether or not the `lsb_release` program is installed, and whether it's part of a "default" install
- The output of `lsb_release -a` if installed
- The contents of `/etc/lsb-release`, if it exists
- The contents of any other `/etc/*-release` files
- Any other reliable way to determine the flavor and version of your Linux distribution, especially if none of the above exist

And finally, you can test the platform detection on your platform by downloading and installing (e.g. in a virtualenv) [lionshead](https://bitbucket.org/natefoo/lionshead/) and running:

```console
% python -c 'import lionshead; print lionshead.get_specific_platform()'
```

e.g.:

```console
% pip install -e 'hg+https://bitbucket.org/natefoo/wheel#egg=wheel'
% python -c 'import wheel.pep425tags; print wheel.pep425tags.get_platforms()'
['linux_x86_64_ubuntu_14_04', 'linux_x86_64', 'any']
```

If `lsb_release` is optional on your system and especially if `/etc/os-release` does not exist, it'd be even more helpful to run the above prior to installing `lsb_release`, and again afterward.