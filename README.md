# POSTEST64

For OSX, follow this guide, but run `./client_osx` instead of `./client`

For Windows, follow this guide by Decker https://github.com/DeckerSU/SuperNET/blob/dev-decker-dev/iguana/dexscripts.win32/postest64_how_to.md


Download and install the marketmaker. This guide assumes you have `jq` installed already. (`sudo apt-get install jq`)

To use the createaddrs.sh script to just generate your address's and wifs

> `./createaddrs.sh <username> false`

To automatically import the wifs to POSTEST64C

> `./createadrs.sh <username> true`



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
