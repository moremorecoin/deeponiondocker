apt-get update
apt-get install -y build-essential libtool autotools-dev autoconf pkg-config libssl-dev apt-utils libboost-all-dev libqrencode-dev libminiupnpc-dev libevent-dev git software-properties-common libjson-pp-perl curl automake bsdmainutils libminiupnpc-dev libcap-dev libseccomp-dev

add-apt-repository ppa:bitcoin/bitcoin
apt-get update 
apt-get install -y --allow-unauthenticated libdb4.8-dev libdb4.8++-dev
git clone --recursive https://github.com/deeponion/deeponion.git
cd deeponion
./autogen.sh
./configure --without-gui
make
cp src/DeepOniond /bin/
cd ../..
rm -rf deeponion
