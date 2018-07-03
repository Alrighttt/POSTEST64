# POSTEST64

Download and install the marketmaker. This guide assumes you have `jq` installed already. (`sudo apt-get install jq`)

```shell
git clone https://github.com/jl777/SuperNET
cd SuperNET/iguana/exchanges
git checkout dev
./install
cd ../dexscripts
cp ../exchanges/passphrase passphrase
cp ../exchanges/userpass userpass
```
Edit the passphrase file with a strong passphrase, and start the marketmaker

```shell
./client
```

This will output the userpass value for your password, open a new terminal and edit the `userpass` file to reflect this userpass.

```shell
. userpass
curl --url "http://127.0.0.1:7783" --data "{\"userpass\":\"$userpass\",\"method\":\"gen64addrs\",\"passphrase\":\"STRONGPASSPHRASE\"}" | jq .addresses > SENDTOALRIGHT
```

Save the marketmaker's output. This will be used to import the private keys to the daemon once the chain is live. Send the SENDTOALRIGHT file to Alright on discord or make a pull request to this repo. If you choose to contact Alright, please confirm that your addresses were added before the test begins. 

Please follow the same format. Add 1 file with your username containing your addresses. Please be sure to add *1* address and your username to the distribution file also. 
