# DeepOnion Docker
## Staking DeepOnion in the Could, or anywhere you want!

Have you ever thought of staking your DeepOnion in Amazon Cloud? Or any of your VPS servers? Or even any of your old computers but get pushed back because of the ambiguous installation process? 

Recently I spend quite some time to compile the source code to built a docker instance. The compiling time is around 30 minutes each round, and I compiled it so many times to develop this docker instance so you don't have to spend the time again. If you know what docker is, you probably know you will love this solution. Because it is simple, straight forward, only takes minutes to run your wallet anywhere to start staking. 

Yet another reason to use this v2.0 Could staking docker wallet is that it can backup your wallet every 2 weeks automatically (you can change the frequency easily if you want). You probabaly don't know that you should backup your wallet so frequency -- you are risking of losing money! Please read: https://bitcoin.stackexchange.com/questions/13277/how-frequently-should-one-update-wallet-backup. Most of the altcoins are forked from Bitcoin, therefore has to follow the same backup rules.

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

### Backup wallet file to your email

By default, nothing will be sent out. If you want it to send the wallet file to your email, please follow the instruciton:
1. Register an account at https://www.mailjet.com
2. After login, click your username at top right corner then click "My account" -> "Master API Key & Sub API key management". You should find your main account API KEY and SECRET KEY. Please fill these two keys into your docker-compose.yml file.
3. Fill in the "mail_to", "mail_sender_name", "mail_subject" and "wallet_backup_filename" so the wallet knows where to backup the file. 
4. The docker-compose.yml file should look like the following (the keys are just for example, not real):

```
version: '3'
services:
  onion:
    restart: always
    ports:
    - 127.0.0.1:9998:9999
    environment:
    - Donate_portion_of_staking=0.1
    #Register account at https://www.mailjet.com/
    - mailjet_api_key=xxxxxxxxxxxxxxxxxxxxxxxx
    - mailjet_secret_key=XXXXXXXXXXXXXXXXXXXXXXXXXX
    #Backup wallet file to this email address
    - mail_to=my_secret_email@Xmail.com
    #when filling the following blanks, be creative
    - mail_sender_name=Cloud Wallet
    #title and content of the backup email
    - mail_subject=Important file auto backup
    #wallet filename, set it you don't want it to be wallet.dat
    - wallet_backup_filename=another_file_name
    volumes:
     - ./DeepOnionConf:/root/.DeepOnion
    image: morecoin/deeponion:2.0
```

5. Now you can restart your wallet to reload the configuration:
```
sudo docker-compose down
sudo docker-compose up -d
```
6. Since you always use encrypted wallet, now unlock it for staking:
```
perl unlock_wallet_for_staking.pl
```
7. Check the status.log for a few minutes to make sure the staking is started:
```
$ tail -f DeepOnionConf/status.log
Wallet starting up ...
Please use unlock_wallet_for_staking.pl to unlock wallet
Password received, trying to unlock wallet for staking
Wallet unlocked successfully
1516590793, Balance=999.99000000, Staking=false, Expetedtime=0
1516590793, Balance=999.99000000, Staking=true, Expetedtime=2234785
1516590793, Balance=999.99000000, Staking=true, Expetedtime=2234785
```
NOTE: It is risky to use the same wallet in multiple computers. If you want to use the desktop wallet, it's better stop the cloud wallet first, then copy the very latest wallet.dat to your desktop computer to start the wallet program. 

### Change the frequency of status report and wallet backup

If you want to change the frequency, please add REPORT_STATUS_FREQ_IN_SEC and BACKUP_WALLET_FREQ_IN_SEC into the environment section like this:
```
version: '3'
services:
  onion:
    restart: always
    ports:
    - 127.0.0.1:9998:9999
    environment:
    #report status every 5 minutes
    - REPORT_STATUS_FREQ_IN_SEC=300
    #backup wallet every week
    - BACKUP_WALLET_FREQ_IN_SEC=604800
    ... ...
    ... ...
```

### Donation

My DeepOnion address is **DUwpwQSL68Eu4ExaYVS8XgDTPRgTwUZwwM**, please donate to help this work. By default, the docker wallet donates 10% of your staking incomes to the above address every time before it backups your wallet file, if you don't feel like this idea, please set Donate_portion_of_staking to 0 to disable it before you start the docker.
