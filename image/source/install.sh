    apt-get update
    apt-get install -y build-essential libtool autotools-dev autoconf pkg-config libssl-dev apt-utils
    apt-get install -y libboost-all-dev
    apt-get install -y libqrencode-dev
    apt-get install -y libminiupnpc-dev
    apt-get install -y libevent-dev
    apt-get install -y git

    apt-get install -y software-properties-common
    add-apt-repository ppa:bitcoin/bitcoin
    #echo "deb-src http://ppa.launchpad.net/bitcoin/bitcoin/ubuntu zesty main" > /etc/apt/sources.list.d/bitcoin-ubuntu-bitcoin-bionic.list
    #echo "deb http://ppa.launchpad.net/bitcoin/bitcoin/ubuntu zesty main" >> /etc/apt/sources.list.d/bitcoin-ubuntu-bitcoin-bionic.list
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
