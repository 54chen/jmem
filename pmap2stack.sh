#! /bin/bash

PID=$1;
PMAP_FILE=/tmp/pmap.${PID};
PSTACK_FILE=/tmp/pstack.${PID};
JSTACK_FILE=/tmp/jstack.${PID};
JSTACK_M_FILE=/tmp/jstack.m.${PID};



START=$2
STOP=$3

pmap -x ${PID} | awk "{if(\$3 > ${START} && \$3 < ${STOP})print}" > ${PMAP_FILE};

pstack ${PID} > ${PSTACK_FILE};

jstack ${PID} > ${JSTACK_FILE};

jstack -m ${PID} > ${JSTACK_M_FILE};

for L in `cat ${PMAP_FILE} | awk -F ' ' '{print $1}'`
do
    echo "${L}";
    LI=`echo ${L}|sed 's/^0\+//'`
    grep -sH ${LI} ${PSTACK_FILE};
    grep -sH ${LI} ${JSTACK_FILE};
    grep -sH ${LI} ${JSTACK_M_FILE};
    echo "";
done;
