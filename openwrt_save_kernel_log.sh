#!/bin/bash

log_dir="/root/log/kernel"


if ! [ -d "$log_dir" ]; then
    # create log directory
    mkdir -p "$log_dir"
fi


fulltime=$(date "+%Y%m%d_%H%M%S")

logfile="$log_dir/kernel_$fulltime.log"
echo -e "==== Started kernel logging at $fulltime ====" > "$logfile"
kernel_log=$(dmesg)
echo "$kernel_log" >> "$logfile"

while true; do
    # 获取内核日志
    new_kernel_log=$(dmesg | tail -n 1)
    if [[ "$kernel_log" != *"$new_kernel_log" ]]; then
        # 内核日志有更新
        echo "$new_kernel_log" >> "$logfile"
        kernel_log="$new_kernel_log"
    fi
done
