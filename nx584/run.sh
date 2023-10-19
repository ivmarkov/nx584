#!/usr/bin/with-contenv bashio


bashio::log.info "Preparing to start..."

## Get variables from the user config options.
serial_dev=$(bashio::config 'serial_dev')
serial_baud=$(bashio::config 'serial_baud')

DEBUG=""
if bashio::config.true 'debug.enabled'; then
  bashio::log.info " * DEBUG Mode ON..."
  DEBUG="--debug True "
fi

## Start Serial Interface
python3 /usr/bin/nx584_server  --serial $serial_dev --baud $serial_baud --listen 0.0.0.0 --port 5007 --config /data/config.ini $DEBUG

## Web interface
#python3 /usr/bin/nx584_server --listen 0.0.0.0 --port 5007 --connect 192.168.30.1:10000 --config /usr/app/src/config.ini



