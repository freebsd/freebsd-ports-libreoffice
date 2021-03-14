#!/bin/sh

PORT=editors/libreoffice

PORTSDIR=/usr/ports

set -ex

pwd

cd /usr
mv ports ports.old
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

echo "NO_ZFS=yes" >> /usr/local/etc/poudriere.conf
echo "ALLOW_MAKE_JOBS=yes" >> /usr/local/etc/poudriere.conf
sed -i.bak -e 's,FREEBSD_HOST=_PROTO_://_CHANGE_THIS_,FREEBSD_HOST=https://download.FreeBSD.org,' /usr/local/etc/poudriere.conf
mkdir -p /usr/local/poudriere

poudriere jail -c -j jail -v `uname -r`
poudriere ports -c -f none -m null -M /usr/ports

# bootstrap pkg repo
poudriere bulk -t -j jail ports-mgmt/pkg

cd /usr/ports/${PORT}
make all-depends-list | awk -F'/' '{print $4"/"$5}' | xargs \
pkg fetch -y -o /usr/local/poudriere/data/packages/jail-default/.latest

set +e
poudriere testport -j jail ${PORT}
RESULT=$?
if [ ${RESULT} -eq 0 ]; then
	exit 0
fi
set -e

ls -l /usr/local/poudriere/data/logs/bulk/jail-default/latest/logs/errors
for i in /usr/local/poudriere/data/logs/bulk/jail-default/latest/logs/errors/*.log
do
	echo ==== $i ====
	cat $i
done

exit ${RESULT}
