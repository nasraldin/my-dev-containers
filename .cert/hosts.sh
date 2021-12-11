#!/usr/bin/env bash
# Add the hosts name to /etc/hosts file
# 
# by Nasr Aldin
# nasr2ldin@gmail.com
# https://github.com/nasraldin
# 

# Path to your hosts file
hostsFile="/etc/hosts"

# Default IP address for host
ip="127.0.0.1"

# Hostname to add/remove.
# hostname="$2"

# Array of hosts we need to add
array=("dev.local" "auth.local" "phpmyadmin.local" "seq.local" "redis.local" "camunda.local" "rabbitmq.local")

yell() { echo "$0: $*" >&2; }
die() { yell "$*"; exit 111; }
try() { "$@" || die "cannot $*"; }

# Check if 1 and 2 are null
# if [ -z "$1" ] || [ -z "$2" ]; then
#    die "Exiting... invalid arguments";
# fi

remove() {
  for hostname in "${array[@]}"
  do
    if [ -n "$(grep -w "$hostname$" /etc/hosts)" ]; then
        echo "$hostname found in $hostsFile. Removing now...";
        try sudo sed -ie "/[[:space:]]$hostname/d" "$hostsFile";
    else
        yell "$hostname was not found in $hostsFile";
    fi    
  done
}

add() {
  for hostname in "${array[@]}"
  do
    if [ -n "$(grep -P "[[:space:]]$hostname" /etc/hosts)" ]; then
        yell "$hostname, already exists: $(grep $hostname $hostsFile)";
    else
        echo "Adding $hostname to $hostsFile...";
        try printf "%s\t%s\n" "$ip" "$hostname" | sudo tee -a "$hostsFile" > /dev/null;

        if [ -n "$(grep $hostname /etc/hosts)" ]; then
            echo "$hostname was added succesfully:";
            echo "$(grep $hostname /etc/hosts)";
        else
            die "Failed to add $hostname";
        fi
    fi
  done
}

$@