# NX584 Home Assistant Add-on

This is a very simple Home Assistant add-on for the [NX584 Interface Server](https://github.com/kk7ds/pynx584)

## How to use

* Install Add-On
* Configure Add-on
* Refer to the [configuration documentation](https://github.com/kk7ds/pynx584) of the NX584 server and:
  * Change [config.ini](nx584/config.ini) to describe your NX panel configuration (number of zones, zone names, ES vs US date-time format, etc.)
  * Change [run.sh](nx584/run.sh) to reflect how you'll connect the NX584 server to the NX pannel. (Where it says `--connect 192.168.30.1:10000`)
* [Configure your NX584 Alarm Panel and Binary Sensors](https://www.home-assistant.io/integrations/nx584/) in Home Assistant

**HINT**: If the add-on was installed successfully, you should see something like this in the `Logs` section of the add-on:
```
s6-rc: info: service s6rc-oneshot-runner: starting
s6-rc: info: service s6rc-oneshot-runner successfully started
s6-rc: info: service fix-attrs: starting
s6-rc: info: service fix-attrs successfully started
s6-rc: info: service legacy-cont-init: starting
s6-rc: info: service legacy-cont-init successfully started
s6-rc: info: service legacy-services: starting
s6-rc: info: service legacy-services successfully started
2022-09-11 13:32:40,591 main INFO Ready
2022-09-11 13:32:40,654 controller INFO Loaded extensions []
 * Serving Flask app 'nx584'
 * Debug mode: off
2022-09-11 13:32:40,668 _internal INFO WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on all addresses (0.0.0.0)
 * Running on http://127.0.0.1:5007
 * Running on http://172.30.33.3:5007
2022-09-11 13:32:40,669 _internal INFO Press CTRL+C to quit
2022-09-11 13:32:40,733 controller INFO Connected
2022-09-11 13:32:40,734 controller INFO Connected
2022-09-11 13:32:41,184 _internal INFO 172.30.32.1 - - [11/Sep/2022 13:32:41] "GET /partitions HTTP/1.1" 200 -
2022-09-11 13:32:41,790 controller INFO Zone 2 (VZ/Others) state is NORMAL
2022-09-11 13:32:42,013 controller INFO Zone 3 (VZ/Stairs) state is NORMAL
2022-09-11 13:32:42,192 controller INFO Zone 4 (VZ/Bedroom) state is NORMAL
2022-09-11 13:32:42,860 controller INFO System asserts Valid partition 1
2022-09-11 13:32:42,861 controller ERROR System asserts Fail to communicate
2022-09-11 13:32:42,862 controller INFO System asserts AC power on
2022-09-11 13:32:43,530 controller INFO Zone 1 (VZ/Door) state is NORMAL
2022-09-11 13:32:43,534 _internal INFO 172.30.32.1 - - [11/Sep/2022 13:32:43] "GET /events?index=226&timeout=60 HTTP/1.1" 200 -
2022-09-11 13:32:44,201 controller INFO Zone 2 (VZ/Others) state is NORMAL
2022-09-11 13:32:44,205 _internal INFO 172.30.32.1 - - [11/Sep/2022 13:32:44] "GET /events?index=226&timeout=60
```
