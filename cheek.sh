#!/bin/sh


MON=`date +%m`

DAY=`date +%d`
HM=`date +%H:%M:%S`

#
# OUTPUT file location
CPU_FILE=/var/log/Daily_CPU$MON$DAY
MEM_FILE=/var/log/Daily_MEM$MON$DAY
PRO_FILE=/var/log/Daily_PRO$MON$DAY
DISK_FILE=/var/log/Daily_DISK$MON$DAY
CHECK_FILE=/var/log/Daily_CHECK$MON$DAY
SARDATA=/var/log/sa/sa

##### TIME  CPU_Usage
CPU_Idle=`/usr/bin/sar -f $SARDATA$DAY -u 1 |grep  Average | grep " " | awk '{ print $8 }'`
CPU_USED=`echo "100 $CPU_Idle"|awk '{printf "%.2f", $1 - $2}'`

##### TIME  Phy_mem(%)   Vert_mem(%)
M_MSize=`free | grep Mem |awk '{ print $2 }'`
M_Free=`free | grep Mem |awk '{ print $4 }'`
M_Buffer=`free | grep Mem |awk '{ print $6 }'`
M_Cache=`free | grep Mem |awk '{ print $7 }'`
M_Used=`expr \( $M_MSize - $M_Free - $M_Buffer - $M_Cache \)`
#M_Used=`expr \( $M_MSize - $M_Free \) `
M_USED1=`echo "$M_Used $M_MSize"|awk '{printf "%.2f", $1 / $2}'`
M_USED=`echo "$M_USED1 100"|awk '{printf "%.2f", $1 * $2}'`

num_tot=`ps -ef | wc | awk '{print $1}'`
disk_used=`df -k`

#echo "CPU $CPU_USED ">>$CHECK_FILE
#echo "MEM $M_USED">>$CHECK_FILE
#echo "PROC $num_tot">>$CHECK_FILE
#echo "$disk_used">>$CHECK_FILE

echo "CPU $CPU_USED "
echo "MEM $M_USED"
echo "PROC $num_tot"
echo "$disk_used"



sleep 1.5
ls -al /var/log/ | grep Daily_CHECK$MON$DAY
#cat $CHECK_FILE
echo w
w
echo who
who
echo last -n 10
last -n 10

echo dmesg
dmesg | grep -E "waring|Waning|error|Error|crit|notice|Notice"

exit 0