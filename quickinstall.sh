#!/bin/bash

INSTALL_BIN() {
    ls $PWD/bin | while read var; do
        cp $PWD/bin/$var /bin/$var
        chmod +x /bin/$var
    done
}

DELETE_BIN() {
    ls $PWD/bin | while read var; do rm /bin/$var; done
}

say() {

    clear
    echo $1
    sleep $2
}

IP=$(wget -qO- ipv4.icanhazip.com)

awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' >/root/users.db

apt-get update -y
apt-get upgrade -y

DELETE_BIN

# Installing required software
say 'Installing squid3, bc, screen, nano, unzip, dos2unix, wget' 2
apt-get install squid3 bc screen nano unzip dos2unix wget -y

# Removing apache2
killall apache2
apt-get purge apache2 -y
if [ -f "/usr/sbin/ufw" ]; then
    ufw allow 443/tcp
    ufw allow 80/tcp
    ufw allow 3128/tcp
    ufw allow 8799/tcp
    ufw allow 8080/tcp
fi

if [ -d "/etc/squid3/" ]; then
    wget http://phreaker56.obex.pw/vpsmanager/squid1.txt -O /tmp/sqd1
    echo "acl url3 dstdomain -i $ipdovps" >/tmp/sqd2
    wget http://phreaker56.obex.pw/vpsmanager/squid2.txt -O /tmp/sqd3
    cat /tmp/sqd1 /tmp/sqd2 /tmp/sqd3 >/etc/squid3/squid.conf
    wget http://phreaker56.obex.pw/vpsmanager/payload.txt -O /etc/squid3/payload.txt
    echo " " >>/etc/squid3/payload.txt
    grep -v "^Port 443" /etc/ssh/sshd_config >/tmp/ssh && mv /tmp/ssh /etc/ssh/sshd_config
    echo "Port 443" >>/etc/ssh/sshd_config
    grep -v "^PasswordAuthentication yes" /etc/ssh/sshd_config >/tmp/passlogin && mv /tmp/passlogin /etc/ssh/sshd_config
    echo "PasswordAuthentication yes" >>/etc/ssh/sshd_config

    INSTALL_BIN

    if [ ! -f "/etc/init.d/squid3" ]; then
        service squid3 reload >/dev/null
    else
        /etc/init.d/squid3 reload >/dev/null
    fi
    if [ ! -f "/etc/init.d/ssh" ]; then
        service ssh reload >/dev/null
    else
        /etc/init.d/ssh reload >/dev/null
    fi
fi
if [ -d "/etc/squid/" ]; then
    wget http://phreaker56.obex.pw/vpsmanager/squid1.txt -O /tmp/sqd1
    echo "acl url3 dstdomain -i $ipdovps" >/tmp/sqd2
    wget http://phreaker56.obex.pw/vpsmanager/squid.txt -O /tmp/sqd3
    cat /tmp/sqd1 /tmp/sqd2 /tmp/sqd3 >/etc/squid/squid.conf
    wget http://phreaker56.obex.pw/vpsmanager/payload.txt -O /etc/squid/payload.txt
    echo " " >>/etc/squid/payload.txt
    grep -v "^Port 443" /etc/ssh/sshd_config >/tmp/ssh && mv /tmp/ssh /etc/ssh/sshd_config
    echo "Port 443" >>/etc/ssh/sshd_config
    grep -v "^PasswordAuthentication yes" /etc/ssh/sshd_config >/tmp/passlogin && mv /tmp/passlogin /etc/ssh/sshd_config
    echo "PasswordAuthentication yes" >>/etc/ssh/sshd_config

    INSTALL_BIN

    if [ ! -f "/etc/init.d/squid" ]; then
        service squid reload >/dev/null
    else
        /etc/init.d/squid reload >/dev/null
    fi
    if [ ! -f "/etc/init.d/ssh" ]; then
        service ssh reload >/dev/null
    else
        /etc/init.d/ssh reload >/dev/null
    fi
fi
echo ""
tput setaf 7
tput setab 4
tput bold
echo "Squid Proxy Installed and running on ports: 80, 3128, 8080 e 8799. First try 8080 on your client."
tput sgr0
tput setaf 7
tput setab 4
tput bold
echo "OpenSSH running on ports 22 e 443. First try 443 on your client."
tput sgr0
tput setaf 7
tput setab 4
tput bold
echo "User management scripts installed"
tput sgr0
tput setaf 7
tput setab 4
tput bold
echo "Read the documentation to avoid questions and problems.!"
tput sgr0
tput setaf 7
tput setab 4
tput bold
echo "To see the available commands use the command: vpshelp"
tput sgr0
echo ""

grep -v "^Compression yes" /etc/ssh/sshd_config >/tmp/sshcp && mv /tmp/sshcp /etc/ssh/sshd_config