#!/bin/sh

PORTSDIR=/usr/ports

set -ex

pwd

cd /usr
#ls -al ports
mv ports ports.old
#svnlite co svn://svn.freebsd.org/ports/head ports
#portsnap --interactive fetch extract
git clone --depth=1 --single-branch -b master https://github.com/freebsd/freebsd-ports.git ports

cd ${CIRRUS_WORKING_DIR}
for p in `cat list.txt`
do
	if [ -d ${PORTSDIR}/${p}/ ]; then
		rm -fr ${PORTSDIR}/${p}/*
	else
		mkdir -p ${PORTSDIR}/${p}
	fi
        cp -R ./${p}/* ${PORTSDIR}/${p}/
done

mkdir /usr/ports/distfiles

df -h

#cd /usr/ports/editors/libreoffice
#make all-depends-list | awk -F'/' '{print $4"/"$5}' | xargs pkg install -y

echo "NO_ZFS=yes" >> /usr/local/etc/poudriere.conf
echo "ALLOW_MAKE_JOBS=yes" >> /usr/local/etc/poudriere.conf
sed -i.bak -e 's,FREEBSD_HOST=_PROTO_://_CHANGE_THIS_,FREEBSD_HOST=https://download.FreeBSD.org,' /usr/local/etc/poudriere.conf
mkdir -p /usr/local/poudriere

poudriere jail -c -j jail -v `uname -r`
poudriere ports -c -f none -m null -M /usr/ports

# use an easy port to bootstrap pkg repo
poudriere bulk -t -j jail net/nc

PORT=editors/libreoffice

cd /usr/ports
cd ${PORT}
PWD=`pwd -P`
PORTDIR=`dirname ${PWD}`
PORTDIR=`dirname ${PORTDIR}`
sudo pkg fetch -y -o pkgs `make missing`
rm -fr /usr/local/poudriere/data/packages/jail-default/.latest/All
mv pkgs/All /usr/local/poudriere/data/packages/jail-default/.latest/
rm -fr pkgs

poudriere testport -j jail ${PORT}
