#!/bin/bash

# заносим в переменную DATE текущую дату
DATE=`/bin/date '+%Y%m%d'`

#echo $DATE

NAMEUPP="UPP_$DATE.bak"
NAMECRM="CRM_$DATE.bak"
NAMERet="Retail_$DATE.bak"
NAMERetaks="Retail_aks_$DATE.bak"
NAMEBuhaks="Buh_AKS_$DATE.bak"
NAMEauto="Auto_$DATE.tgz"


#echo $NAME

STATUSUPP=`cp -v /mnt/101/UPP/$NAMEUPP /raid/UPP/$NAMEUPP`
STATUSCRM=`cp -v /mnt/k2-d/CRM/$NAMECRM /raid/CRM/$NAMECRM`
STATUSRet=`cp -v /mnt/k3-e/Retail/$NAMERet /raid/Ret20/$NAMERet`
STATUSRetaks=`cp -v /mnt/k3-e/Retail_aks/$NAMERetaks /raid/Ret_aks/$NAMERetaks`
STATUSBuhaks=`cp -v /mnt/k3-f/Buh_AKS/$NAMEBuhaks /raid/Buh_aks/$NAMEBuhaks`
STATUS1cv77=`tar zcvf /raid/1cv77/$NAMEauto /mnt/1c77/TREID07/*`

STATUSRAID=`ls /raid`

RES="\n\n$STATUSUPP\n$STATUSCRM\n$STATUSRet\n$STATUSRetaks\n$STATUSBuhaks\n$STATUS1cv77"

echo $STATUSUPP


#/usr/bin/find /raid/UPP -type f -atime +7 -exec rm -f \{\} \; >/dev/null 2>&1
#/usr/bin/find /raid/CRM -type f -atime +7 -exec rm -f \{\} \; >/dev/null 2>&1

/usr/tools/2mail_m.py "Backup base evening" "$RES"

`bash /usr/tools/rm_old.sh "/raid/UPP"`
`bash /usr/tools/rm_old.sh "/raid/CRM"`
`bash /usr/tools/rm_old.sh "/raid/Ret20"`
`bash /usr/tools/rm_old.sh "/raid/Ret_aks"`
`bash /usr/tools/rm_old.sh "/raid/Buh_aks"`
`bash /usr/tools/rm_old.sh "/raid/1c77"`
