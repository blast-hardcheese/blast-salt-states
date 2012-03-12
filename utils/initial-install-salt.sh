#!/bin/bash

# Use approx
echo "deb http://192.168.0.35:9999/debian testing main non-free contrib" > /etc/apt/sources.list
aptitude update

# Resolve potential cross-release conflicts
aptitude -y dist-upgrade

# Install deps
aptitude install -y python python-virtualenv git build-essential libzmq1 \
                    libzmq-dev swig gnutls-dev libssl-dev python-dev \
                    python-m2crypto

# Make sure we're using the latest virtualenv, then build the deployment virtualenv
if [ ! -d /srv/virtualenv ]; then
    virtualenv --no-site-packages /srv/bootstrap/
    source /srv/bootstrap/bin/activate
    pip install virtualenv
    virtualenv --no-site-packages /srv/virtualenv/
    deactivate
    rm -Rf /srv/bootstrap
fi

# Clone salt
if [ ! -d /srv/salt/salt-github ]; then
    mkdir -p /srv/salt/salt-github
    git clone http://github.com/saltstack/salt.git /srv/salt/salt-github
fi

# Install deps
cd /srv/salt/salt-github
source /srv/virtualenv/bin/activate
pip install -r requirements.txt
pip install -U .

# Fix m2crypto bug on debian
cp /usr/lib/python2.7/dist-packages/M2Crypto/__m2crypto.so /srv/virtualenv/lib/python2.7/site-packages/M2Crypto/__m2crypto.so

# Create initial config
if [ ! -d /etc/salt ]; then
    mkdir /etc/salt
    echo "master: pokecenter" > /etc/salt/minion
fi

# Start salt-minion
salt-minion -l debug
