apt-get update
apt-get install -y build-essential libtool autotools-dev autoconf pkg-config libssl-dev apt-utils libboost-all-dev libqrencode-dev libminiupnpc-dev libevent-dev git software-properties-common libjson-pp-perl curl
add-apt-repository ppa:bitcoin/bitcoin
apt-get update 
apt-get install -y --allow-unauthenticated libdb4.8-dev libdb4.8++-dev
git clone https://github.com/deeponion/deeponion.git
cd deeponion
cd src
cd leveldb/
chmod 755 build_detect_platform
cd ..
make -f makefile.unix
cp DeepOniond /bin/
cd ../..
rm -rf deeponion
