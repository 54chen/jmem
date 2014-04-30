#! /bin/bash
PID=$1;
SML=$2;
BIG=$3;
DIR=/tmp;

pmap -x ${PID} | awk "{if(\$3 > ${SML} && \$3 < ${BIG} ){START=\$1;ARG=\$3;system(\"gdb --quiet --batch --pid ${PID} -ex 'dump memory ${DIR}/${PID}-\"count\".dump 0x\"START\" 0x\"START\"+\"ARG\"001';\");count++}}END{print count}"
