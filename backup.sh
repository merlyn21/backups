#!/bin/bash

# заносим в переменную DATE текущую дату
DATE=`/bin/date '+%Y%m%d'`

#echo $DATE

NAMEUPP="UPP_$DATE.bak"
NAMECRM="CRM832_$DATE.bak"
NAMELOG="Logistika_$DATE.bak"
NAMERet="Retail_office__$DATE.bak"
NAMEZUP_H="ZUP31_H_$DATE.bak"
NAMEZUP="ZUP31_$DATE.bak"

#echo $NAME

STATUSUPP=`cp -v /mnt/101/UPP/$NAMEUPP /raid/UPP/$NAMEUPP`
STATUSCRM=`cp -v /mnt/102/CRM/$NAMECRM /raid/CRM/$NAMECRM`
STATUSCRM=`cp -v /mnt/102/Logistika/$NAMELOG /raid/Logis/$NAMELOG`

STATUSRAID=`ls /raid`

RES="ls raid/\n $STATUSRAID"

echo $STATUSRAID
echo $RES

/usr/bin/find /raid/UPP -type f -atime +7 -exec rm -f \{\} \; >/dev/null 2>&1
/usr/bin/find /raid/CRM -type f -atime +7 -exec rm -f \{\} \; >/dev/null 2>&1

/usr/tools/2mail_m.py "Backup base from MSSQL" "$STATUSRAID"

