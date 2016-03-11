oscR -- Read, write and manipulate order-switchable column tables
=================================================================

Installation on Linux computers
-------------------------------

### From GitHub with `R` (recommended)

```
devtools::install_github('charles-plessy/oscR', upgrade_dependencies = FALSE)
```


### From a Git clone.

```
git clone https://github.com/charles-plessy/oscR.git
R CMD INSTALL oscR
```

In case of error `no permission to install to directory
‘/usr/local/lib/R/site-library’`, create a local R directory with the following
command.

```
/usr/bin/Rscript -e 'dir.create(Sys.getenv("R_LIBS_USER"), recursive=TRUE)'
````


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


### As a Debian package.

The source archive and a Git clone contain a `debian` directory, to build a
Debian package with the usual commands such as `dpkg-buildpackage -us -uc -b`.
