FROM ubuntu:zesty-20171122
MAINTAINER MoreCoin <moremorecoin@gmail.com>
COPY source/install.sh /root
COPY source/DeepOnion.conf /root
COPY source/staking.pl /bin
COPY source/donate.pl /bin
COPY source/dounlock /etc/cron.hourly/dounlock
COPY source/dailycheck /etc/cron.daily/dailycheck
ENV Donate_to DYjzTLpR6Bz9efLV42XvvoQPypd2nFzd2B
ENV Donate_portion_of_staking 0.1
RUN bash /root/install.sh
ENTRYPOINT ["DeepOniond","-conf=/root/DeepOnion.conf"]
