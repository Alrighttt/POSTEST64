# POSTEST64

For OSX, follow this guide, but run `./client_osx` instead of `./client`

For Windows, follow this guide by Decker https://github.com/DeckerSU/SuperNET/blob/dev-decker-dev/iguana/dexscripts.win32/postest64_how_to.md

The following guide assumes you have `jq` installed already. (`sudo apt-get install jq`)

Download and install nanomsg. Follow the guide here:
https://github.com/KomodoPlatform/KomodoPlatform/wiki/Installing-and-Using-Komodo-Platform-(barterDEX)

Download and install the latest komodod. Build from dev branch
```shell
git clone https://github.com/jl777/komodo
cd komodo
git checkout dev
./zcutil/fetch-params.sh
./zcutil/build.sh $(nproc)
```
Start the POSTEST64C chain
```shell
cd ~/komodo/src
./komodod -ac_name=POSTEST64C -ac_supply=100000000 -ac_staked=100 -ac_reward=1000000000 -ac_public=1 -addnode=195.201.20.230 -addnode=195.201.137.5 -addnode=78.47.196.146
```

Clone this repo, edit the `passphrase` file and run the `setup.sh` script. 
```shell
git clone https://github.com/Alrighttt/POSTEST64
cd POSTEST64
```
***Edit the `passphrase` file with a strong passphrase before going any further.****

```shell
./setup.sh <YOURUSERNAME> true
```

This will create a file with your username. Send this to Alright on discord or make a pull request to this repo. If you would like to only generate the addresses but not import them to the daemon, use `false` with the `setup.sh` script.

If you choose to do a pull request please follow the same format. Add 1 file with your username containing your addresses. Please be sure to add *1* address and your username to the distribution file also. 
