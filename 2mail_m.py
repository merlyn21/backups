#!/usr/bin/env python
# coding: utf-8

import smtplib
from email.MIMEText import MIMEText
from email.MIMEMultipart import MIMEMultipart
from email.Header import make_header
from email.Utils import formatdate
import os
import sys
import subprocess



if len(sys.argv) > 1:
    subj = sys.argv[1]
    mess = sys.argv[2]
else:
    print ("Not messge")
    exit(0)


msg = MIMEMultipart()
msg['From'] = ''
msg['To'] = ''
msg['Subject'] = subj
message = mess
msg.attach(MIMEText(message))

mailserver = smtplib.SMTP_SSL('smtp.yandex.ru:465')
#mailserver.ehlo()
#mailserver.starttls()
#mailserver.ehlo()
mailserver.login('wa@wa', 'm_*******')
mailserver.sendmail('','',msg.as_string())
mailserver.quit()



