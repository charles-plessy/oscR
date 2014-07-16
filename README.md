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

#### In case of error `no permission to install to directory ‘/usr/local/lib/R/site-library’`.

Create a local R directory.  Its name can be guessed from the welcome message
given by `R` when it is started.  For example:

    R version 3.1.1 RC (2014-07-04 r66073) -- "Sock it to Me"
    Copyright (C) 2014 The R Foundation for Statistical Computing
    Platform: x86_64-pc-linux-gnu (64-bit)

With the example above, the path is `~/R/x86_64-pc-linux-gnu-library/3.1` (not 3.1.1).


### As a Debian package.

The source archive and a Git clone contain a `debian` directory, to build a
Debian package with the usual commands such as `dpkg-buildpackage -us -uc -b`.
