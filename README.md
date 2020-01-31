[![Build Status](https://api.cirrus-ci.com/github/lwhsu/freebsd-ports-libreoffice.svg)](https://cirrus-ci.com/github/lwhsu/freebsd-ports-libreoffice)

Usage:

 - Edit sync-out.sh:

```
SVN_WC=~/freebsd-ports            # path of ports directory (ex: `/usr/ports`)
LO_WC=~/freebsd-ports-libreoffice # path of this repository
```

 - Run sync-out.sh
 - Build editors/libreoffice and other i18n ports if needed.
