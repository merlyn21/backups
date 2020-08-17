#!/bin/bash

# заносим в переменную DATE текущую дату
DATE=`/bin/date '+%Y%m%d'`

#echo $DATE

NAMEUPP="UPP_$DATE.bak"

#echo $NAME

STATUS=`cp -R -v /mnt/obrabotki82/* /raid/obrabotki82/`

STATUSRAID=`ls /raid`

RES="ls raid/\n $STATUSRAID"

echo $STATUS


#/usr/bin/find /raid/UPP -type f -atime +7 -exec rm -f \{\} \; >/dev/null 2>&1
#/usr/bin/find /raid/CRM -type f -atime +7 -exec rm -f \{\} \; >/dev/null 2>&1

/usr/tools/2mail_m.py "Backup obrabotki82" "$STATUS"

