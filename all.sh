clear

read -p "Press [ENTER]" variable

printf "\e[93m\nDOWNGRADING IPTABLES...\e[0m\n"


sleep 2


wget http://old.kali.org/kali/pool/main/i/iptables/iptables_1.6.2-1.1_arm64.deb
wget http://old.kali.org/kali/pool/main/i/iptables/libip4tc0_1.6.2-1.1_arm64.deb
wget http://old.kali.org/kali/pool/main/i/iptables/libip6tc0_1.6.2-1.1_arm64.deb
wget http://old.kali.org/kali/pool/main/i/iptables/libiptc0_1.6.2-1.1_arm64.deb
wget http://old.kali.org/kali/pool/main/i/iptables/libxtables12_1.6.2-1.1_arm64.deb

dpkg -i *.deb

apt-mark hold iptables
apt-mark hold libip4tc0
apt-mark hold libip6tc0
apt-mark hold libiptc0
apt-mark hold libxtables12

printf "\n\e[93mDONE!!!\e[0m\n"
sleep 2

printf "\n\e[93mINSTALLING HCXTOOLS, HCXDUMPTOOL...\e[0m\n"
sleep 1

apt-get install libcurl4-openssl-dev libssl-dev zlib1g-dev -y

git clone https://github.com/ZerBea/hcxtools
git clone https://github.com/ZerBea/hcxdumptool

cd hcxtools
make
make install

printf "\nDONE!\n"
sleep 2


cd -
cd hcxdumptool
make
make install


printf "DELETING FILES...\n"
sleep 2

cd -
rm -r hcxdumptool
rm -r hcxtools

rm -f iptables_1.6.2-1.1_arm64.deb
rm -f libip4tc0_1.6.2-1.1_arm64.deb
rm -f libip6tc0_1.6.2-1.1_arm64.deb
rm -f libiptc0_1.6.2-1.1_arm64.deb
rm -f libxtables12_1.6.2-1.1_arm64.deb


printf "\n\e[93mDONE!!!\n"

