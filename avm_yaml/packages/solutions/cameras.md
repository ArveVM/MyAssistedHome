                                                  ArveVM, December.2022
# Camearas
### Why Cameras?  
- Need a way for record when people come visit (warnings), recording in case of theft and general surveilamce
- Record no audio
- Record only when movement
<br />

### Table of contents:
|Chapter   | Description/purpose                |
| --------| ----------------------------------- |
|[How it works](#how-it-works-for-me)      |High level view - how it works|
|[Camera](#view-cameras)      |Camera-card|
|[Requirements/install tipstroubleshooting](#requirementsinstall-tipstroubleshooting)|Some guidance on what is required and how to install (not at all my biggest priority to keep this up to date, but at least I have tried somehow ;)|
|[Credits and inspiration](#creditsinspiration)|Listing the particular support, ideas, resources that I have to thank especially for this Solution|
<br />
<br />

## How it works (for me):
- Buy cameras that work with ONVIF. 
- Try camera-stream in VLC-media-palyer to ensure you have right stream
- Add camera-stream with right arguments to Frigate-config (see Frigate instructions for guidance
- Add camera-entity to Frigate-card
<br />
<br />
<br />

## View cameras:
|Card preview    |Card |Config|
| --------| ------------ |----- |
|![image](https://user-images.githubusercontent.com/96014323/205927784-703bac11-cab7-4fca-b54c-d06f74fd28b2.png)|[Camera card](https://github.com/ArveVM/HomeAssistantConfig4/blob/master/avm_yaml/dashboard/solutions/camera_card.yaml)|n/a <br /> - Frigate integration configured in GUI <br /> - Frigate Docker configured on unRaid|
|![image](https://user-images.githubusercontent.com/96014323/205928128-76472a75-c081-41ec-bfa8-bf2198b1fd57.png)|second tab |- click left/right for other cameras <br /> - frigate-bird gives menu of recordings/snapshots/timeline etc|
|![image](https://user-images.githubusercontent.com/96014323/205928299-1e5a1a95-8f80-4479-b779-5c9603584df4.png)|third tab ||
|![image](https://user-images.githubusercontent.com/96014323/205928498-4146efd8-2054-423f-8092-bcf8a8a08c3f.png)|last tab|Added picture-glance of an old camera without onvif (added as generic-camera in GUI)|

<br />
<br />
<br />


## Requirements/install tips/troubleshooting:
<details>
  <summary> Click to unfold list of booring requirements, tips etc </summary>
  
  #### Functionality required (other than what is builtin in my version of HA):
  - unRaid Docker: Frigate
  - HACS-integration: Frigate
  - HACS-frontend: rigate-card
  - HACS-frontend: tabbed-card
  - HACS-frontend: auto-entities
  Optional
  - Dashboard:
    * yaml-dashboard (but you can copy dashboard-code to UI-dashboard/card 

<br />
<br />
<br />
 
  #### To install you should:
  - Install Frigate docker   -  (optional HA-Addon; Frigate)
  - add config to Frigate-docker (config-file need to be created, verify in Frigate web-ui that you have connection to camera(s)) 
  - Installed HA frigate-integration (ensure you get in the frigate-cameras)

  - copy and insert code for card whereever suitable for your installation
  - redo/change to your naming standards/cameras/entities  :)

  <br />
  
  #### template-editor test-code:
  nah,,

  <br />

  #### Other info:
  maybe someday I will document the docker-setup and -config  ;),, just maybe,,,

  for birdseye-view:
  https://github.com/blakeblackshear/frigate/issues/2606
  look at comment from mattkasa commented on Jan 19  for an card-update within lovelace card-config!!
  
  
</details>
<br />
<br />
<br />

## Credits/inspiration:
- Kenneth M, partial Frigate config ;)
<br />
<br />
<br />

## improvements planned/project queue:
- Better documentation of server/docker setup
- might do something with history/graphs  etc?  counter on how often ?
- warning/popup when person detected (and a pause-function?)
