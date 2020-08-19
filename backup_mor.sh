#!/bin/bash

# заносим в переменную DATE текущую дату
DATE=`/bin/date '+%Y%m%d'`

#echo $DATE

NAMELOG="Logistika_$DATE.bak"
NAMERet="Retail_office_$DATE.bak"
NAMEZUP_H="ZUP31_H_$DATE.bak"
NAMEZUP="ZUP_31_$DATE.bak"
NAMEBUH="Buh_$DATE.bak"
NAMEBUHM="Buh_Murugova$DATE.bak"


#echo $NAME

STATUSlog=`cp -v /mnt/k2-e/Logistika/$NAMELOG /raid/Logis/$NAMELOG`
STATUSRet=`cp -v /mnt/101/Retail_office/$NAMERet /raid/Ret/$NAMERet`
STATUSZUPH=`cp -v /mnt/101/ZUP31_H/$NAMEZUP_H /raid/ZUP31_H/$NAMEZUP_H`
STATUSZUP=`cp -v /mnt/101/ZUP_31/$NAMEZUP /raid/ZUP31/$NAMEZUP`
STATUSBUH=`cp -v /mnt/k3-f/Buh/$NAMEBUH /raid/Buh/$NAMEBUH`
STATUSBUHM=`cp -v /mnt/k3-f/Buh_Murugova/$NAMEBUHM /raid/Buh_m/$NAMEBUHM`


bash /usr/tools/rm_old.sh "/raid/Logis"
bash /usr/tools/rm_old.sh "/raid/Ret"
bash /usr/tools/rm_old.sh "/raid/ZUP31_H"
bash /usr/tools/rm_old.sh "/raid/ZUP31"
bash /usr/tools/rm_old.sh "/raid/Buh"
bash /usr/tools/rm_old.sh "/raid/Buh_m"

res_df=`df -h | grep raid`

STATUSRAID=`cat /proc/mdstat`

RES="Logistika=$STATUSlog
     Retail_office=$STATUSRet
     ZUP_H=$STATUSZUPH
     ZUP=$STATUSZUP
     Buh=$STATUSBUH
     Buh_Murugova=$STATUSBUHM
     
     Storage: $res_df

     raid: $STATUSRAID"
#     $STATUSZUPH\n$STATUSZUP\n$STATUSBUH\n$STATUSBUHM"

echo $STATUSlog
#echo $RES

#/usr/bin/find /raid/UPP -type f -atime +7 -exec rm -f \{\} \; >/dev/null 2>&1
#/usr/bin/find /raid/CRM -type f -atime +7 -exec rm -f \{\} \; >/dev/null 2>&1

/usr/tools/2mail_m.py "Backup base morning" "$RES"
