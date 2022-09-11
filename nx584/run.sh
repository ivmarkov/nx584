#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json

CONNECTION="$(bashio::config 'connection')"
DEVICE="$(bashio::config 'serial_device')"
BAUDRATE="$(bashio::config 'serial_device_baudrate')"
HOST="$(bashio::config 'host')"
PORT="$(bashio::config 'port')"

BINARY_PROTOCOL="$(bashio::config 'binary_protocol')"
EU_DATE_FORMAT="$(bashio::config 'eu_date_format')"
HEARTBEAT_SECS="$(bashio::config 'heartbeat_secs')"
UPDATE_ZONE_NAMES="$(bashio::config 'update_zone_names')"
ZONES="$(bashio::config 'zones')"
ZONE_1_NAME="$(bashio::config 'zone_1_name')"
ZONE_2_NAME="$(bashio::config 'zone_2_name')"
ZONE_3_NAME="$(bashio::config 'zone_3_name')"
ZONE_4_NAME="$(bashio::config 'zone_4_name')"
ZONE_5_NAME="$(bashio::config 'zone_5_name')"
ZONE_6_NAME="$(bashio::config 'zone_6_name')"
ZONE_7_NAME="$(bashio::config 'zone_7_name')"
ZONE_8_NAME="$(bashio::config 'zone_8_name')"
ZONE_9_NAME="$(bashio::config 'zone_9_name')"
ZONE_10_NAME="$(bashio::config 'zone_10_name')"
ZONE_11_NAME="$(bashio::config 'zone_11_name')"
ZONE_12_NAME="$(bashio::config 'zone_12_name')"
ZONE_13_NAME="$(bashio::config 'zone_13_name')"
ZONE_14_NAME="$(bashio::config 'zone_14_name')"
ZONE_15_NAME="$(bashio::config 'zone_15_name')"
ZONE_16_NAME="$(bashio::config 'zone_16_name')"

if [$CONNECTION -eq "TCP/IP"]
then
  CONNECT="--connect $HOST:$PORT"
else
  CONNECT="--serial $DEVICE --baudrate $BAUDRATE"
fi

mkdirs /usr/app/src
cat >/usr/app/src/config.ini <<EOF
[config]
# max_zone is the highest numbered zone you have populated
max_zone = $ZONES

# Disable zone name updates from NX8 system. If your system doesn't set zone
# names and you prefer define them through pynx584, set this value to False.
# Defaults to True
zone_name_update = $UPDATE_ZONE_NAMES

# Set to true if your unit sends DD/MM dates instead of MM/DD
euro_date_format = $EU_DATE_FORMAT

# Set To true if using binary protocol
# Defaults to False
use_binary_protocol = $BINARY_PROTOCOL

# Length of idle time before sending heartbeat keep alive
# (This is useful with the NX590 as it disconnects idle connections in a
# short period of time)
# Defaults to 120 seconds
idle_time_heartbeat_seconds = $HEARTBEAT_SECS

[zones]
# Zone names
1 = $ZONE_1_NAME
2 = $ZONE_2_NAME
3 = $ZONE_3_NAME
4 = $ZONE_4_NAME
5 = $ZONE_5_NAME
6 = $ZONE_6_NAME
7 = $ZONE_7_NAME
8 = $ZONE_8_NAME
9 = $ZONE_9_NAME
10 = $ZONE_10_NAME
11 = $ZONE_11_NAME
12 = $ZONE_12_NAME
13 = $ZONE_13_NAME
14 = $ZONE_14_NAME
15 = $ZONE_15_NAME
16 = $ZONE_16_NAME
EOF

CONFIG_INI=$(cat /usr/app/src/config.ini)

echo "About to run the NX584 server with setup:"
echo ================\nConnection arg:\n$CONNECT\n"
echo ================\nconfig.ini:\n$CONFIG_INI\n"
echo ================\n"

python3 /usr/bin/nx584_server --listen 0.0.0.0 --port 5007 $CONNECT --config /usr/app/src/config.ini
