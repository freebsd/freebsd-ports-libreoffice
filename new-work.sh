#!/bin/sh

mv work work.old
rm -fr work.old &
mv work.bak work
cp -R work.bak2 work.bak &

wait
