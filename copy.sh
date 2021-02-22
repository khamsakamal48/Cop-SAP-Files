#!/bin/bash
# 
# Copyright (c) 2021 Kamal Hamza
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#Change directory for cronjob
cd "$(dirname "$0")";

shopt -s nullglob
csv_files=(/home/SFTP_Server/Arjuna/SAP/*.csv)

#Check if files exist
if [ -f "$csv_files" ]; then
     # body
     #Copy Start time
     start_time=$(date +%c)

     #Housekeeping
     rm -rf log.txt;
     touch log.txt;

     #Start Copying TOTAL_EMP_*
     echo "################################################" >> log.txt
     echo "############# TOTAL EMPLOYEE FILES #############" >> log.txt
     echo "################################################" >> log.txt
     sshpass -f cred.txt rsync --remove-source-files -avzh --stats -e "ssh -p 2222 -o StrictHostKeyChecking=no" /home/SFTP_Server/Arjuna/SAP/TOTAL_EMP_* nachiket@10.199.4.240:~/Pictures/SAP/EMPLOYEE/ | sed '0,/^$/d' >> log.txt;

     #Start Copying IRCC_PRJIHPA*
     echo "" >> log.txt
     echo "################################################" >> log.txt
     echo "######## RESPONSIBLE PI and CO-PI FILES ########" >> log.txt
     echo "################################################" >> log.txt
     sshpass -f cred.txt rsync --remove-source-files -avzh --stats -e "ssh -p 2222 -o StrictHostKeyChecking=no" /home/SFTP_Server/Arjuna/SAP/IRCC_PRJIHPA* nachiket@10.199.4.240:~/Pictures/SAP/Picopiaadmin/ | sed '0,/^$/d' >> log.txt;
 
     #Start Copying IRCC_PRJ2*
     echo "" >> log.txt
     echo "################################################" >> log.txt
     echo "################ PROJECT FILES #################" >> log.txt
     echo "################################################" >> log.txt
     sshpass -f cred.txt rsync --remove-source-files -avzh --stats -e "ssh -p 2222 -o StrictHostKeyChecking=no" /home/SFTP_Server/Arjuna/SAP/IRCC_PRJ2* nachiket@10.199.4.240:~/Pictures/SAP/Prjproject/ | sed '0,/^$/d' >> log.txt;

     #Start Copying IRCC_PRJSTAT*
     echo "" >> log.txt
     echo "################################################" >> log.txt
     echo "############# PROJECT STATUS FILES #############" >> log.txt
     echo "################################################" >> log.txt
     sshpass -f cred.txt rsync --remove-source-files -avzh --stats -e "ssh -p 2222 -o StrictHostKeyChecking=no" /home/SFTP_Server/Arjuna/SAP/IRCC_PRJSTAT* nachiket@10.199.4.240:~/Pictures/SAP/StatusStat/ | sed '0,/^$/d' >> log.txt;
 
     #Start Copying IGM_TRANS_*
     echo "" >> log.txt
     echo "################################################" >> log.txt
     echo "############ SUB TRANSACTION FILES #############" >> log.txt
     echo "################################################" >> log.txt
     sshpass -f cred.txt rsync --remove-source-files -avzh --stats -e "ssh -p 2222 -o StrictHostKeyChecking=no" /home/SFTP_Server/Arjuna/SAP/GM_TRANS_* nachiket@10.199.4.240:~/Pictures/SAP/Transation/ | sed '0,/^$/d' >> log.txt;
 
     #Start Copying IRCC_PRJPRPS*
     echo "" >> log.txt
     echo "################################################" >> log.txt
     echo "################# SUB WBS FILES #################" >> log.txt
     echo "################################################" >> log.txt
     sshpass -f cred.txt rsync --remove-source-files -avzh --stats -e "ssh -p 2222 -o StrictHostKeyChecking=no" /home/SFTP_Server/Arjuna/SAP/IRCC_PRJPRPS* nachiket@10.199.4.240:~/Pictures/SAP/WBSPRPS/ | sed '0,/^$/d' >> log.txt;
 
     #Start Copying IRCC_PRJWBS*
     echo "" >> log.txt
     echo "################################################" >> log.txt
     echo "################# IRCC_PRJWBS ##################" >> log.txt
     echo "################################################" >> log.txt
     sshpass -f cred.txt rsync --remove-source-files -avzh --stats -e "ssh -p 2222 -o StrictHostKeyChecking=no" /home/SFTP_Server/Arjuna/SAP/IRCC_PRJWBS* nachiket@10.199.4.240:~/Pictures/SAP/allowances/ | sed '0,/^$/d' >> log.txt;
 
     #Start Copying GL_*
     echo "" >> log.txt
     echo "################################################" >> log.txt
     echo "########## DETAILED TRANSACTION FILES ##########" >> log.txt
     echo "################################################" >> log.txt
     sshpass -f cred.txt rsync --remove-source-files -avzh --stats -e "ssh -p 2222 -o StrictHostKeyChecking=no" /home/SFTP_Server/Arjuna/SAP/GL_* nachiket@10.199.4.240:~/Pictures/SAP/gltrans/ | sed '0,/^$/d' >> log.txt;
 
     #Start Copying IRCC_PRJSPNC*
     echo "" >> log.txt
     echo "################################################" >> log.txt
     echo "################# BUDGET FILES #################" >> log.txt
     echo "################################################" >> log.txt
     sshpass -f cred.txt rsync --remove-source-files -avzh --stats -e "ssh -p 2222 -o StrictHostKeyChecking=no" /home/SFTP_Server/Arjuna/SAP/IRCC_PRJSPNC* nachiket@10.199.4.240:~/Pictures/SAP/prjpnc/ | sed '0,/^$/d' >> log.txt;
 
     #Start Copying ZFI*
     echo "" >> log.txt
     echo "################################################" >> log.txt
     echo "################# ZFI FILES #################" >> log.txt
     echo "################################################" >> log.txt
     sshpass -f cred.txt rsync --remove-source-files -avzh --stats -e "ssh -p 2222 -o StrictHostKeyChecking=no" /home/SFTP_Server/Arjuna/SAP/ZFI* nachiket@10.199.4.240:~/Pictures/SAP/ZFI/ | sed '0,/^$/d' >> log.txt;
 
     #Copy End time
     end_time=$(date +%c)
 
     #Upload detailed log in Pastebin
     log=$(cat log.txt)
     key=$(cat api_key.txt)
 
     curl --request POST -sL \
         --url 'https://pastebin.com/api/api_post.php' \
         --data "api_dev_key=${key}" \
         --data 'api_option=paste' \
         --data "api_paste_code=${log}" \
         --data 'api_paste_private=1' \
         --data 'api_paste_format=prolog' \
         --data 'api_paste_name=SAP Files Copy Log Summary' \
         --data 'api_paste_expire_date=2W' \
     > log_upload.txt;

     if [ -s log_upload.txt ]; then
          log_link=$(cat log_upload.txt)
 
          #Prepare JSON file for email
          jq -n --arg start_time "$start_time" --arg end_time "$end_time" --arg log_link "$log_link" '{ "start_time": $start_time, "end_time": $end_time, "log_link": $log_link }' > email_details.json;
     
          #Send Emails
          cp email_details.json Email/email_details.json;
          cd Email;
          ./Email_Sender.sh;
          sleep 5;
          exit
     fi
else
     echo "Nothing to do as there are no new CSV files"
fi
