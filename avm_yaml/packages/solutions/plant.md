                                                  ArveVM, November.2022
# my Plants


## Why Plants in HA? 
- I'm not a gardener, but like to have some large plants. Combined with short term memory,, plant sensors and input on how to attend plants seems like a good idea
- So I googled a bit, and found something I found useful, and created a 'solution' for my Plants.

Focus so far have been on: 
- Getting control of what are correct tolerances for light, water and fertilizer for each type of plant


## How it works (for me):
- First set up HA with Bluetooth (see my doc on Bluetooth/espHome BT-proxy)
- then buy a MiFlora BT flower-sensor
- connect MiFlora to HA,, mine are picked up by Xiaomi BLE-integration,, it will give 5 sensors    (rename device to Plant-xx (change xx to next number of physical plant-sensors, and physically label the actual device))
- add integration Plant Monitor,, add name of plant and choose the sensors from the MiFlora (and possible a humidity-sensor from the room)
  - you might want to check for latin plant names at [Pl@ntNet](https://identify.plantnet.org/the-plant-list/species)
  - if you don't get the latin name right, the openplantbook-integration is helping you choose the right one,,,,
- then the integration will add a plant.-device and a bunch of number-helpers for thresholds collected from openplant - which will be used by the plant card and plant status


## Solution-Yaml:
- n/a,, this solution is just a combination of hacs-integration(s) and a card

## Dashboard(s):
PS; the card has no UI,, so you have to configure in YAML (but good guides on the github)

<img width="237" alt="image" src="https://user-images.githubusercontent.com/96014323/199611333-dd8b233b-e725-45be-a5af-b119aa97d8f6.png">


---


---

## Functionality:


| Type      | Name                                       | Description/purpose |
| ----------| ------------------------------------------ | ------------------- |
|HACS-int   | [Plant](https://github.com/Olen/homeassistant-plant/) | Create devices of plants, get data from openplantbook, create thresholds, present in card
|HACS-int   | [ OpenPlantbook](https://github.com/Olen/home-assistant-openplantbook) | Let Plant get data from openplantbook, input to thresholds
|HACS-card  | [ Flower Card](https://github.com/Olen/lovelace-flower-card/) | Present plant in card, showing name, picture, thresholds




# toDo/improvements planned:
- might want to add link to 
- battery-status on mi-sensors??


# Credits/inspiration:
- ThomasH 
- Author(s) of HACS-integrations 



