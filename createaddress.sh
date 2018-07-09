#!/bin/bash
currdir=$PWD
cd ~/SuperNET/iguana
./m_mm
cp marketmaker $currdir
cd $currdir
source passphrase
source ~/SuperNET/iguana/exchanges/coins
./marketmaker "{\"gui\":\"nogui\", \"client\":1, \"canbind\":0, \"userhome\":\"/${HOME#"/"}\",\"passphrase\":\"default\", \"coins\":$coins}" &
sleep 10
userpass=$(curl -s --url "http://127.0.0.1:7783" --data "{\"userpass\":\"1d8b27b21efabcd96571cd56f91a40fb9aa4cc623d273c63bf9223dc6f8cd81f\",\"method\":\"passphrase\",\"passphrase\":\"$passphrase\",\"gui\":\"nogui\"}" | jq -r .userpass)
echo "userpass=$userpass" > userpass
sleep 5
Address=$(curl --url "http://127.0.0.1:7783" --data "{\"userpass\":\"$userpass\",\"method\":\"gen64addrs\",\"passphrase\":\"$passphrase\"}")
echo $Address | jq .addrpairs > private_keys
echo $Address | jq .addresses > SENDTOALRIGHT
pkill -15 marketmaker
echo "FINISHED"
echo "Your private keys and publickeys are saved in the file private_keys."
echo "Please send the SENDTOALRIGHT file to @Alright"
echo "Once you have the chain running simply run this script again to import the private keys to your wallet and don't change the passphrase!"
