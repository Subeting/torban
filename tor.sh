#!/bin/bash
v6=":"
echo "Begin to download target ips,process start in 5s"
sleep 5s

echo "Cleaning previous data"
rulez="$(ip -4 route|grep metric|grep 23)
$(ip -6 route|grep metric|grep 23)"
IFS_old=$IFS
IFS=$'\n'
for arule in $rulez
  do
    IFS=$IFS_old
    arr=($arule)
    brule="$(echo ${arr[0]} ${arr[1]} ${arr[2]})"
    ip route del $brule
      
  done
IFS=$IFS_old

echo "Old version cleared.Downloading newer ones"
uk="$(curl https://www.dan.me.uk/torlist/)"
if [[ $uk =~ "too often" ]];
then
uk=""
fi
ips="$uk $(curl https://raw.githubusercontent.com/SecOps-Institute/Tor-IP-Addresses/master/tor-nodes.lst) $(curl https://raw.githubusercontent.com/Subeting/torban/main/bridge.txt)"
ips="$(echo $ips|uniq)"
echo "downloaded!Tor ban started."
for line in $ips
  do
    if [[ $line == "" ]];
    then 
      continue
    fi
    if [[ $line =~ $v6 ]];
   then
   ip -6 route add ${line}/64 dev lo metric 23
   else
   line="$(echo $line|grep -v ":"|awk -F '.' '{print $1"."$2"."$3"."0}'|uniq|sort)"
   ip route add ${line}/24 via 127.0.0.1 dev lo metric 23
   fi
  done
