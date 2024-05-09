#!/bin/bash

log_dir="/root/log/openwrt"


if ! [ -d "$log_dir" ]; then
    # create log directory
    mkdir -p "$log_dir"
fi

function writeNew() {
    # nowdate=$(date "+%Y%m%d")
    fulltime=$(date "+%Y%m%d_%H%M%S")

    logfile="$log_dir/openwrt_$fulltime.log"
    echo -e "==== Started logging at $fulltime ====" >> "$logfile"
    logread >> "$logfile"

    # background the logread process
    logread -f >> "$logfile" &
}

writeNew
