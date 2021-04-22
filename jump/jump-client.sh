#!/usr/bin/env bash

SSH_TARGET_SERVER="$1"
CONFIG_FILE="$HOME/.dotfiles/jump/jump-client.json"

. "$HOME/.dotfiles/jump/jump-functions.sh"

trap cleanup err exit

read_config SSL_SERVER .ssl_server
read_config SSL_CERT .ssl_cert
read_config SSL_CA .ssl_ca
read_config SSL_CN .ssl_cn

read_config SSH_JUMP_HOST .ssh_jump_host
read_config SSH_JUMP_PORT .ssh_jump_port
read_config SSH_JUMP_USER .ssh_jump_user

SSL_OPTS="cert=$SSL_CERT,cafile=$SSL_CA,commonname=$SSL_CN"

socat TCP-LISTEN:"$SSH_JUMP_PORT",fork,reuseaddr OPENSSL:"$SSL_SERVER,$SSL_OPTS" &
if [ 0 -ne $? ]; then
    echo "failed launching socat tunnel" 1>&2
    exit 1
fi

SOCAT_PID=$!

ssh -W "$SSH_TARGET_SERVER" "$SSH_JUMP_HOST" -p "$SSH_JUMP_PORT" -l "$SSH_JUMP_USER" 
