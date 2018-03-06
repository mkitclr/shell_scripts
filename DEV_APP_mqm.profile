#!/bin/sh
#
#Initial Draft - Nagi R Guntaka 12/17/14
#This will set the environment for QMGR you are working on 
#
#set -x
QMGR=$1
usage1() { 
echo "you should be sourcing this script: . $PATH/mqm_profile QMGR"
}
usage() {
echo "usage: you should be providing the QMGR you are working on"
}

if ( [[ $_ != $0 ]] && [[ $_ != $SHELL ]] );
then 
if [ "$#" != 1 ]
then
   echo " you can only work on one installation/QMGR"
   echo "available Queue Managers are "
   if [ -f /var/mqm/mqs.ini ]
   then grep -w "Name" /var/mqm/mqs.ini|grep -v Module|cut -d '=' -f2
   fi
   usage
else 
case "$QMGR" in
 "MQAPPDEV" )
    . /opt/mqm/bin/setmqenv -s 
  ;;        
 "MQAPPDEV2" )
    . /opt/mqm/bin/setmqenv -s 
  ;;        
 "MQAPPDEV3" )
    . /opt/mqapp3mq/bin/setmqenv -s 
  ;;        
 "MQAPPQA" )
    . /opt/mqm/bin/setmqenv -s 
  ;;        
 *)
    exit 1
  ;;
esac

fi
else
 exit 1

fi
