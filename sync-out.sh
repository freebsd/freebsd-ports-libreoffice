#!/bin/sh -ex

SVN_WC=~/freebsd-ports
LO_WC=~/freebsd-ports-libreoffice

for p in `cat list.txt`
do
	if [ -d ${SVN_WC}/${p}/ ]; then
		rm -fr ${SVN_WC}/${p}/*
	else
		mkdir -p ${SVN_WC}/${p}
	fi
        cp -R ${LO_WC}/${p}/* ${SVN_WC}/${p}/
done
