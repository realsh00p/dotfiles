#!/usr/bin/env bash

if [ -z "$1" ]; then
    CONFIG_FILE="$HOME/.dotfiles/jump/jump-server.json"
    echo "no config file supplied, using default ($CONFIG_FILE)"
else
    CONFIG_FILE="$1"
fi

if [ -z "$2" ]; then
    FUNCTIONS_PATH="$HOME/.dotfiles/jump/jump-functions.sh"
    echo "no functions file supplied, using default ($FUNCTIONS_FILE)"
else
    FUNCTIONS_PATH="$2"
fi

. "$FUNCTIONS_PATH"

read_config SSL_LISTEN .ssl_listen
read_config SSL_CERT .ssl_cert
read_config SSL_CA .ssl_ca

read_config SSH_TARGET .ssh_target

SSL_OPTS="fork,reuseaddr,cert=$SSL_CERT,cafile=$SSL_CA"

socat OPENSSL-LISTEN:"$SSL_LISTEN","$SSL_OPTS" TCP4:"$SSH_TARGET"
