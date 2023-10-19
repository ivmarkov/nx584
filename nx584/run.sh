#!/usr/bin/with-contenv bashio

## Get variables from the user config options.
serial_dev=$(bashio::config 'serial_dev')
serial_baud=$(bashio::config 'serial_baud')
config_file=$(bashio::config 'config_file')

echo $config_file > /usr/app/src/config.ini 

## Start Serial Interface
python3 /usr/bin/nx584_server  --serial $serial_dev --baud $serial_baud --listen 0.0.0.0 --port 5007 --config /usr/app/src/config.ini 

## Web interface
#python3 /usr/bin/nx584_server --listen 0.0.0.0 --port 5007 --connect 192.168.30.1:10000 --config /usr/app/src/config.ini



