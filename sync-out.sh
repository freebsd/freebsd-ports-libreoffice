#!/bin/sh -ex

SVN_WC=~/freebsd-ports
LO_WC=~/freebsd-ports-libreoffice

for p in `cat list.txt`
do
        rm -fr ${SVN_WC}/${p}/*
        cp -R ${LO_WC}/${p}/* ${SVN_WC}/${p}/
done
