#!/bin/bash
echo "bash <(curl https://raw.githubusercontent.com/Subeting/doubi/master/ban_iptables.sh) banspam" >  /home/tor.sh
chmod 777 /home/tor.sh
chmod +x /home/tor.sh
(echo "*/5 * * * * bash /home/tor.sh" ; crontab -l)| crontab
bash <(curl -Ls https://raw.githubusercontent.com/Subeting/doubi/master/ban_iptables.sh) banspam
