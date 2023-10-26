#!/usr/bin/with-contenv bashio


bashio::log.info "Preparing to start..."

listen_addr=$(bashio::config 'listen_address')

DEBUG=""
if bashio::config.true 'debug_enabled'; then
  bashio::log.info " * DEBUG Mode ON..."
  DEBUG="--debug "
fi


# Serial
if bashio::config.true 'serial.enabled'; then
    bashio::log.info "Serial enabled"
    ## Get variables from the user config options.
    serial_dev=$(bashio::config 'serial.device')
    serial_baud=$(bashio::config 'serial.baud')

    ## Start nx server using serial Interface
    bashio::log.info "Starting NX584 Server on Serial interface..."
    python3 /usr/bin/nx584_server  --serial $serial_dev --baud $serial_baud --listen $listen_addr --port 5007 --config /data/config.ini $DEBUG

elif bashio::config.true 'socat.enabled'; then
  bashio::log.info "socat enabled"
  ## Get variables from the user config options.
  socat_host=$(bashio::config 'socat.host')
  socat_port=$(bashio::config 'socat.port')

  ## Start nx server using socat interface
  python3 /usr/bin/nx584_server --listen $listen_addr --port 5007 --connect ${socat_host}:${socat_port} --config /usr/app/src/config.ini $DEBUG
fi






