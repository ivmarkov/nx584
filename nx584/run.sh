#!/usr/bin/with-contenv bashio

bashio::log.info $(cat /etc/os-release)
bashio::log.info "Preparing to start..."

docker_ip=$(ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}')
listen_addr=$(bashio::config 'listen_address')
bashio::log.info "Docker IP $docker_ip / Listener Address $listen_addr "

DEBUG=""
if bashio::config.true 'debug_enabled'; then
  bashio::log.info " * DEBUG Mode ON..."
  DEBUG="--debug "
fi

# To-DO Build /data/config.ini dynamically taking config files
config=$(bashio::config 'config')
bashio::log.info "LOG: $config"

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






