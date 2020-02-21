#!/bin/sh

# Set firewall rules (Master)
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="152.84.101.0/24" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="152.84.98.0/24" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="152.84.71.0/24" accept'
firewall-cmd --reload
firewall-cmd --list-all


chown -R 472:472 config/grafana/


# Install netdata
bash <(curl -Ss https://my-netdata.io/kickstart.sh)

# Netdata (Master)

echo "enabled = yes" >> /etc/netdata/netdata.conf
echo "registry to announce = https://152.84.101.156">> /etc/netdata/netdata.conf

systemctl restart netdata