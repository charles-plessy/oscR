oscR -- Read, write and manipulate order-switchable column tables
=================================================================

Installation on Linux computers
-------------------------------

### From source archive.

 * Downolad a release from <https://github.com/charles-plessy/oscR/releases>.
   The name will look like `0.1.1.tar.gz`.  To download from the command line
   interface, use the `wget command`, for instance:

```
wget https://github.com/charles-plessy/oscR/archive/0.1.1.tar.gz
```

 * Install it with a command such as the following.

```
R CMD INSTALL 0.1.1.tar.gz
```

### From a Git clone.

```
git clone https://github.com/charles-plessy/oscR.git
R CMD INSTALL oscR
```

### As a Debian package.

The source archive and a Git clone contain a `debian` directory, to build a
Debian package with the usual commands such as `dpkg-buildpackage -us -uc -b`.
