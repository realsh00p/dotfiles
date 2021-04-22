CLIENT:
Use in .ssh/config as follows:

  Host some_remote_host
    ProxyCommand /path/to/jump.sh %h:%p

SERVER:
Launch server like so:
   jump-server.sh <path to jump-server.json> <path to jump-functions.sh>

Make sure that your ssh pub key is authorized on server.
