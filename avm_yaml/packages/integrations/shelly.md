                                                  ArveVM, 14.march.2022
# Shelly-integration
[Official HA-documentation](https://www.home-assistant.io/integrations/shelly/)


DOCUMENTATION MOVED TO WIKI,, SEE MY GitHub-WIKI FOR UPDATED DOCUMENTATION!!


## How I use Shelly-integration:  
- Add Shelly-devices, how to configure network etc
- Disclaimer; this is my setup on my internal network and functionality is a bit trumphing security,, but to my reqirements this is sufficient.
- No config in this file,, just explenation my setup and on how to reconfigure

# my Shelly-devices:  
- [Shelly1](https://shelly.cloud/products/shelly-1-smart-home-automation-relay/) - Lightswitches and Hotwater
- [Shelly1-tempAddon](https://shop.shelly.cloud/temperature-sensor-addon-for-shelly-1-1pm-wifi-smart-home-automation) - Hotwater,, connected two dallas-sensors to report temp bottom and top of the tank
- [Shelly+1](https://shelly.cloud/shelly-plus-1/)  -  ??
- [Shelly+1pm](https://shelly.cloud/shelly-plus-1pm/) - Floor-heaters, Washingmachines
- [Shelly RC snubber](https://shop.shelly.cloud/rc-snubber-wifi-smart-home-automation?search=snubber&description=true) - Washingmachines
- [Shelly PlugS](https://shelly.cloud/products/shelly-plug-s-smart-home-automation-device/) - Dishwaser, Tumbledryer, Freezer, Heaters



## PRIMARY SETUP:
1. First setup Shelly integraton  ->  https://www.home-assistant.io/integrations/shelly/

2. Setup NoT-network - so that Shelly's are isolated on "their own network"
       - NoT: xxx.xxx.30.xx
   my setup is currently mostly a duplicate of the guidance from Rob; 
     https://www.youtube.com/watch?v=ufJ3dPAgFiM
   include NoT SSID and passthrough from NoT to Home Assistant-server
   Setup Firewall-group 'Shellys' so we can use that group for: 
            - access to Shellys from all admin-devices
            - temporary granting Shellys internet access for firmware-upgrade
   Setup Firewall-group 'ShellyAdm' to enable those deveices to access shellies from LAN
            - add my mobile phone and pc's IP to this group

3. Setup internal NTP-functionality if you don't already have that
     I just added the Add-on Chrony in HA,, so i can use SNTP = my HA ip-adress

4. Create card for Shelly-devices web-interface ; 
      add the code below to a card in a dashboard and you will get easy 
      access to your Shelly-devices web interfaces
      (and make a note that I consider my NoT to be "safe" so I don't bother 
      with any pin or other security measurements.)
--
type: entities
title: 'Shelly web-interfaces'
entities:
  - type: weblink
    name: Shelly+1 test-device  ->  web-interface
    url: http://xxx.xxx.30.deviceIP/
--



## ADD DEVICE TO HA:
1. Shelly-device; Power on

2. PC/mobile: Connect to Shelly-device wifi 
      (see shelly-userguides, can use app or browser)
      (shelly's publish their own SSID on startup, so you have to log
      on to that to re-configure, or use the app)
      I prefer using mobile or pc and browser: http://192.168.33.1

3. PC/mobile; Configure wifi on Shelly-device -> NoT-network (must add the NoT-ssid and password) 

4. Firewall/router-config; 
     Router:
       - Set "Use Fixed IP Address" on connected device (= Unify's way to do IP-reservation)
       - get IP of Shelly-device added to NoT-network - for further config,,
     Firewall
       - Add IP to Firewall-group 'Shellys'

5. HA; Add a record for new Shelly-device in card 'Shelly web-interfaces'    
     (se PrimarySetup #4)

6. PC/mobile; Log into Shelly-device web intercface and re-configure the generic stuff:
     WIFI:
       Connect to wifi; 'NoT'      (= no internet, only access to HA-server, no global NTP)
       Set static IP; xxx.xxx.30.deviceIP
       Set network mask; 255.255.255.0
       Set gateway;   xxx.xxx.30.1/
     SNTP SERVER:
       Server;        HA-server-IP  (chrony)
     DEVICE NAME = 'insert name of device'
     TIME ZONE AND GEO-LOCATION:
       Automatically detect Time zone = OFF
       Timezone Settings = Europe/Oslo
     ECO MODE = ON     (disable if wifi is unstable at device location)
     Run firmware upgrade (must enable internet to NoT on firewall first)

7. Restart ShellyDevice to enable HA autodiscover new device
     not quite sure why a restart is required - something with network zoning that is not quite right in my config ??

8. Might configure/enable some entities according to usage,,,


## Firmware upgrade:
1. Enable firewall rule to allow NoT/Shellies internet access
2. Log on to web-interface of each Shelly and check for updates
      (could also enable the sensor 'OTA updates' but I prefer to disabe thoose not in use)
3. Disable firewall rule to allow NoT/Shellies internet access

optional -   use this tool to select which firmware to up/downgrade to   http://archive.shelly-tools.de/


## my Shelly web-interfaces:
Using GitHub as CMDB for Shellies, and as a backup to get to the web-interfaces in case HA is ##cked up.

<details><summary>List of hyperlinks to local web-access to my Shelly-devices</summary>
<p>

| Name	|Type  | Description/purpose |
|-------|-------|----------| 
| [Laundry dryer](http://192.168.30.14/)  | ShellyPlug S | Solution = Laundry Dryer |
| [Bathroom2 heater puck](http://192.168.30.19/) | Shelly+1pm | Solution = Bathroom2 Heater |
| [Hotwater](http://192.168.30.20/) | Shelly1 | Solution = Hotwater temp |
| [Office heater](http://192.168.30.22/)  | ShellyPlug S | Solution = Office heater |
| [Kitchen heater](http://192.168.30.24/)  | ShellyPlug S | Solution = Office heater |
| [Kitchen switch1](http://192.168.30.38/)  | Shelly1 | Solution = Kitchen |
| [Shelly EM](http://192.168.30.39/)  | ShellyEM | Solution = ?? |
| [Hallway switch2](http://192.168.30.43/)  | Shelly2pm | Solution = Hallway |
| [Laundry light puck](http://192.168.30.51/)  | Shelly+1 | Solution = Laundry |
| [Livingroom light puck1](http://192.168.30.81/)  | Shelly1 | Solution = Livingroom |
| [Laundry heater puck](http://192.168.30.89/) | Shelly+1pm | Solution = Laundry Heater |
| [Laundry washer puck](http://192.168.30.188/)  | Shelly+1pm | Solution = Laundry Washer |
| [Livingroom switch S2](http://192.168.30.248/)  | ShellyPlug S | Solution = Livingroom |
| [Dishwasher](http://192.168.30.252/)  | ShellyPlug S | Solution = Dishwasher |
  

</p>
</details>
