[![Build Status](https://api.cirrus-ci.com/github/freebsd/freebsd-ports-libreoffice.svg)](https://cirrus-ci.com/github/freebsd/freebsd-ports-libreoffice)

Usage:

Overlay:

- Put this line in /etc/make.conf:

```
OVERLAYS+=/path/to/freebsd-ports-libreoffice
```

- Build freebsd-ports-libreoffice/editors/libreoffice and other i18n ports if needed.

Old method:

 - Edit sync-out.sh:

```
SVN_WC=~/freebsd-ports            # path of ports directory (ex: `/usr/ports`)
LO_WC=~/freebsd-ports-libreoffice # path of this repository
```

 - Run sync-out.sh
 - Build editors/libreoffice and other i18n ports if needed.
