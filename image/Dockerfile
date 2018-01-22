FROM ubuntu:xenial-20180112.1
MAINTAINER MoreCoin <moremorecoin@gmail.com>
COPY source/install.sh /root
COPY source/configure.conf /root
COPY source/status_report.pl /bin
COPY source/keeper.pl /bin
RUN bash /root/install.sh
ENV WALLETCMD DeepOniond
ENV CONFIGUREFOLDER /root/.DeepOnion
ENV CONFIGUREFILE DeepOnion.conf
ENV CURRENCY ONION
ENV REPORT_STATUS_FREQ_IN_SEC 600
ENV BACKUP_WALLET_FREQ_IN_SEC 1209600
ENV DAEMON_ARGUMENT -daemon
ENV Donate_portion_of_staking 0.1
ENV Donate_command sendtoaddress
ENV Donate_address DUwpwQSL68Eu4ExaYVS8XgDTPRgTwUZwwM
ENTRYPOINT ["keeper.pl"]
