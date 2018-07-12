#!/bin/bash
username=$1
importwif=$2
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
echo $Address | jq .addresses > $username
echo $Address | jq .addrpairs[] > wifs

if [[ $importwif = "true" ]]; then
  while read p; do
        wif="${p%\"}"
        wif="${wif#\"}"
        cd ~/komodo/src
        ./komodo-cli -ac_name=POSTEST64C importprivkey "$wif"
  done <wifs
fi

pkill -15 marketmaker
echo "FINISHED"
echo "Your private keys have been imported and saved to the file wifs."
echo "Please send the SENDTOALRIGHT file to @Alright"
