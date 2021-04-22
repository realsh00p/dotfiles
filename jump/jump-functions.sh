#!/usr/bin/env bash
function cleanup()
{
    kill "$SOCAT_PID"
}

function read_config()
{
    if [ ! -f "$CONFIG_FILE" ]; then
        echo "no config file found at $CONFIG_FILE"
        exit 1
    fi 

    local __return="$1"
    local __field="$2"

    eval result=$(cat $CONFIG_FILE | jq -r $__field)

    if [ "null" == result ]; then
        echo "could not parse field $__field" 1>&2
        exit 1
    fi

    eval $__return="$result"
}
