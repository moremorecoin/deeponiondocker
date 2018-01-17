# DeepOnion Docker
## Staking DeepOnion in the Could, or anywhere you want!

Have you ever thought of staking your DeepOnion in Amazon Cloud? Or any of your VPS servers? Or even any of your old computers but get pushed back because of the ambiguous installation process? 

Recently I spend quite some time to compile the source code to built a docker instance. The compiling time is around 30 minutes each round, and I compiled it so many times to develop this docker instance so you don't have to spend the time again. If you know what docker is, you probably know you will love this solution. Because it is simple, straight forward, only takes minutes to run your wallet anywhere to start staking. 

### Get started
First, please install **Docker** and **Docker Compose** to your AWS/VPS/Any Computer, by following this guide: https://docs.docker.com/compose/install/

Then, download source code from my GitHub repository: 

```
git clone https://github.com/moremorecoin/deeponiondocker.git
```

Last, run it by:

```
cd deeponiondocker
sudo docker-compose up -d
```
> If you want to build the docker instance on your own, simply go to the image folder and run the build.sh like this:
> ```
> cd deeponiondocker/image
> sudo sh build.sh
> ```
> After you got the docker built, go back to deeponiondocker folder to launch it:
> ```
> cd ..
> sudo docker-compose up -d
> ```

After a few seconds, you should see there are wallet.dat file as well as other log files in DeepOnionConf folder, you can then copy your own wallet.dat file into DeepOnionConf folder to replace the auto-generated wallet.dat file. After DeepOnion syncronized all the blocks, your staking will begin automatically. 

### Encrypted wallet

If your wallet is encrypted, after you start the docker, you can run unlock_wallet_for_staking.pl to unlock your wallet for staking only:

```
perl unlock_wallet_for_staking.pl
```

You will be asked for password to unlock the wallet. After you type it in, the password will be passed to the docker instance to unlock the wallet. You don't have to write down your password into docker-compose.yml file anymore.


### Monitoring

To check the wallet status, you can take a look at the log file DeepOnionConf/debug.log. To get the progressive output, run:

```
tail -f DeepOnionConf/debug.log
```

To check the staking status, see DeepOnionConf/status.log. This file should be updated every 10 minutes. If you see the staking status is false, try to check it again 10 minutes later, please make sure you have unlocked your wallet if it is encrypted.

If you want to use command line on your own -- to see your wallet address, send coin, check balance etc, you can attach to the docker instance this way:

```
sudo docker exec -it deeponion_onion_1 bash
```

To show some commands for use:

```
DeepOniond help
```

After you are done, type 'exit' to leave the console. 


### Shutdown

If you want to turn off the wallet, simply run this command in the same folder of docker-compose.yml file:

```
sudo docker-compose down
```

### Donation

My DeepOnion address is **DUwpwQSL68Eu4ExaYVS8XgDTPRgTwUZwwM**, please donate to help this work. 
