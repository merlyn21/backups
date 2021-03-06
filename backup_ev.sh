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
NAMEMerc="UPP_Merc_$DATE.bak"


#echo $NAME

STATUSUPP=`cp -v /mnt/101/UPP/$NAMEUPP /raid/UPP/$NAMEUPP`
STATUSCRM=`cp -v /mnt/k2-d/CRM/$NAMECRM /raid/CRM/$NAMECRM`
STATUSRet=`cp -v /mnt/k3-e/Retail/$NAMERet /raid/Ret20/$NAMERet`
STATUSRetaks=`cp -v /mnt/k3-e/Retail_aks/$NAMERetaks /raid/Ret_aks/$NAMERetaks`
STATUSBuhaks=`cp -v /mnt/k3-f/Buh_AKS/$NAMEBuhaks /raid/Buh_aks/$NAMEBuhaks`
STATUSMerc=`cp -v /mnt/k4/UPP_Merc/$NAMEMerc /raid/UPP_Merc/$NAMEMerc`
`tar zcvf /raid/1cv77/$NAMEauto /mnt/1c77/TREID07/*`
STATUS1cv77=$?

STATUSRAID=`cat /proc/mdstat`

`bash /usr/tools/rm_old.sh "/raid/UPP"`
`bash /usr/tools/rm_old.sh "/raid/CRM"`
`bash /usr/tools/rm_old.sh "/raid/Ret20"`
`bash /usr/tools/rm_old.sh "/raid/Ret_aks"`
`bash /usr/tools/rm_old.sh "/raid/Buh_aks"`
`bash /usr/tools/rm_old.sh "/raid/UPP_Merc"`
`bash /usr/tools/rm_old.sh "/raid/1cv77"`


df_res=`df -h | grep raid`

RES="UPP=$STATUSUPP
     CRM=$STATUSCRM
     Retail=$STATUSRet
     Retail_aks=$STATUSRetaks
     Buh_AKS=$STATUSBuhaks
     UPP_Merc=$STATUSMerc
     TREID07=$STATUS1cv77

     storage: $df_res

     raid: $STATUSRAID"

echo $STATUSUPP


#/usr/bin/find /raid/UPP -type f -atime +7 -exec rm -f \{\} \; >/dev/null 2>&1
#/usr/bin/find /raid/CRM -type f -atime +7 -exec rm -f \{\} \; >/dev/null 2>&1

/usr/tools/2mail_m.py "Backup base evening" "$RES"

