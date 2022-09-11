# NX584 Home Assistant Add-on

This is a very simple Home Assistant add-on for the [NX584 Interface Server](https://github.com/kk7ds/pynx584)

## How to use

* Fork this repository (this is necesary, because currently this add-on does not have any user configuration)
* Refer to the [configuration documentation](https://github.com/kk7ds/pynx584) of the NX584 server and:
  * Change [config.ini](nx584/config.ini) to describe your NX panel configuration (number of zones, zone names, ES vs US date-time format, etc.)
  * Change [run.sh](nx584/run.sh) to reflect how you'll connect the NX584 server to the NX pannel. (Where it says `--connect 192.168.30.1:10000`)
* Push your changes to your forked repository
* Add your forked repository as a [Third-Party Add-On in Home Assistant](https://www.home-assistant.io/common-tasks/os#installing-third-party-add-ons)
* If the add-on was installed successfully, you should see something like this in the `Logs` section of the add-on:
  ```
  TBD
  ```
* [Configure your NX584 Alarm Panel and Binary Sensors](https://www.home-assistant.io/integrations/nx584/) in Home Assistant
