#!/bin/sh -ex

SVN_WC=~/freebsd-ports

for p in `cat list.txt`
do
        rm -fr ${p}/*
        cp -R ${SVN_WC}/${p}/* ${p}/
done
