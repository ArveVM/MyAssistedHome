                                                  ArveVM, November.2022
# AdGuard

## Why AdGuard?  
- Need a way for the wife to control AdGuard (read; disable ad-blocking), so integrated it to HA and made a chip/popup from which she can control.
<br />

### Table of contents:
|Chapter   | Description/purpose                |
| --------| ----------------------------------- |
|[How it works](#how-it-works-for-me)      |High level view - how it works|
|[Adguard in HA](#adguard-in-HA)      |card|
|[Requirements/install tipstroubleshooting](#requirementsinstall-tipstroubleshooting)|Some guidance on what is required and how to install (not at all my biggest priority to keep this up to date, but at least I have tried somehow ;)|
|[Credits and inspiration](#creditsinspiration)|Listing the particular support, ideas, resources that I have to thank especially for this Solution|
<br />
<br />

## How it works (for me):
- Add Adguard docker in unRaid. 
- Add Adguard integration in HA (point to docker ip/port)
- Add Adguard card (see below)
  - use card to toggle on/off as needed  
<br />
<br />
<br />


### AdGuard in HA:
|Card preview    |Card |Config|
| --------| ------------ |----- |
|<img width="199" alt="image" src="https://user-images.githubusercontent.com/96014323/213938301-1ce241f7-a418-4ed5-af3f-6f45afe2a957.png">|[AdGuard card](https://github.com/ArveVM/HomeAssistantConfig4/blob/master/avm_yaml/dashboard/solutions/camera_card.yaml)|- n/a <br /> - Adguard-integration configured in GUI <br /> - AdGuard Docker configured on unRaid|
<br />
<br />
<br />


## Requirements/install tips/troubleshooting:
<details>
  <summary> Click to unfold list of booring requirements, tips etc </summary>
  
  #### Functionality required (other than what is builtin in my version of HA):
  - https://www.home-assistant.io/integrations/adguard/
  - HACS: browser mod - for popup-functionality (now updated to browser_mod v2)
  - HACS: custom:button-card
  - HACS: custom:auto-entities
  Optional
  - Dashboard:
    * yaml-dashboard (but you can copy dashboard-code to UI-dashboard/card 

  <br />
 
  #### To install you should:
  - Installed AdGuard docker
  - Installed HA Adguard-integration
  - add config to AdGuard-docker  
  - created chip/popup to view status
  - first set up packages/solutions as specified elsewhere in my brilliant documentation. 
  - copy and insert code for card whereever suitable for your installation
  - redo/change to your naming standards  :)

  <br />
  
  #### template-editor test-code:
  nah,,

  <br />

  #### Other info:
  maybe someday I will document the docker-setup and adguard-config  ;),, just maybe,,,
  
  
</details>

<br />
<br />
<br />

## Credits/inspiration:
- lots of assistance and guiding from ThomasH: so hjuge thanks ;)
<br />
<br />
<br />

## improvements planned/project queue:
- Better documentation of server/docker setup
- might do something with history/graphs  etc?
- slight adjustment towards new layout (this is not good at all :( )
