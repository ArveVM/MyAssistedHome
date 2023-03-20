                                                  ArveVM, September.2022
# my Home Assistant statistics
### Why Home Assistant Statistics??  
- I'm actually rather fond of numbers and looking at development through history of a journey from an number perspective
- So I googled a bit, and found something I found useful, and created a 'solution' for hastats. And then split it into a few sub-solutions just for structure.
<br />

### Table of contents:
|Chapter   | Description/purpose                |
| --------| ----------------------------------- |
|[HAstats-main](#hastats-main)      |Gather all sub-solutions in one card   <br /> Tabbed card with sub-solutions on each tab <br /> One tab with reference to this GitHub-repo for documentation-purposes|
|[HAstats-Integrations](#hastats-integrations)      |Counter of integrations loaded  <br /> Graphed long term history <br /> PopUp with list of all current integrations, with load-times at startup/reload|
|[HAstats-Enteties By Domain](#hastats-entities-by-domain-ebd)      |Counter of entities pr domain <br /> Grouped and presented 5 most "important" <br /> Graphed long term history <br /> PopUp with list of all current integrations, with load-times at startup/reload|
|[HAstats-DB](https://github.com/ArveVM/HomeAssistantConfig4/edit/master/avm_yaml/packages/solutions/hastats.md#hastats-db)|Track size of Recorder DataBase|
|[Requirements&install-tips](#requirementsinstall-tips)|Some guidance on what is required and how to install (not at all my biggest priority to keep this up to date, but at least I have tried somehow ;)|
|[Credits and inspiration](#creditsinspiration)|Listing the particular support, ideas, resources that I have to thank especially for this Solution|
<br />
<br />

## How it works (for me):
- Created sensors to count different KPI's of my HA-installations "growth". Added sensors as long term statistics - so we can see (and graph) long term trends
- Adding sub-solutions for each type of stats, so that it is easier to grasp concept of each "kpi-group"
  - Adding card for each sub-solution
- Adding tabbed card to combine all sub-solutions in one card.
<br />
<br />

## HAstats-main
|Card preview | Card |Config  |
| --------| ------------ |----- |
|<img width="336" alt="image" src="https://user-images.githubusercontent.com/96014323/213890190-2dc63605-e8f2-4f1f-b031-0ab61f47931e.png"> |[HAstats-card](https://github.com/ArveVM/HomeAssistantConfig4/edit/master/avm_yaml/dashboard/solutions/hastats_card.yaml) |- n/a |


One tabbed card to gather sub-solutions in one view. Added one tab for documentation
<br />
<br />
<br />


## HAstats-Integrations
(sub-solution)
|Card preview | Card |Config  |
| --------| ------------ |----- |
|<img width="268" alt="image" src="https://user-images.githubusercontent.com/96014323/213888773-1a695b5d-7955-4c1c-b4b0-12a4e21f83d2.png"> |[HAstats_int_card](https://github.com/ArveVM/HomeAssistantConfig4/blob/master/avm_yaml/dashboard/solutions/hastats_integrations_card.yaml)|[HAstats_integrations.yaml](https://github.com/ArveVM/HomeAssistantConfig4/blob/master/avm_yaml/packages/solutions/hastats_integrations.yaml) |
|<img width="316" alt="image" src="https://user-images.githubusercontent.com/96014323/213888991-09ed22f6-dd4e-4095-8800-51b47aae3da1.png">|Popup "Integrations by startup-time"||

|Input    | Created      | 
| --------| ------------ |
|n/a      |sensor.hastats_db_size

Using history-explorer-graph with long-term statistics enabled, so the configured sensor with long term statistics enabled are visible.
<br />
<br />
<br />

## HAstats-Entities By Domain (ebd)
|Card preview | Card |Config  |
| --------| ------------ |----- |
|<img width="261" alt="image" src="https://user-images.githubusercontent.com/96014323/213890691-5e39a084-b6c3-403b-a264-cbd3fb7a9aeb.png"> |[HAstats_ebd_card](https://github.com/ArveVM/HomeAssistantConfig4/blob/master/avm_yaml/dashboard/solutions/hastats_entities_by_domain_card.yaml) |[hastats_ebd.yaml](https://github.com/ArveVM/HomeAssistantConfig4/blob/master/avm_yaml/packages/solutions/hastats_ebd.yaml)|
|<img width="301" alt="image" src="https://user-images.githubusercontent.com/96014323/213891309-5a815a73-2ceb-4997-a2c6-904856c35446.png">|Popup "Total"||
|<img width="301" alt="image" src="https://user-images.githubusercontent.com/96014323/213891466-fa4ceb80-8916-4471-9b60-ac3b88dd609f.png">|Popup "Sensors"||
|<img width="297" alt="image" src="https://user-images.githubusercontent.com/96014323/213891537-2f5b7a3b-3efd-4c7f-89aa-e55dd60b0765.png">|Popup "Automations"||
||etc on scripts and lights||


|Input    | Created      | 
| --------| ------------ |
|n/a      |tons of sensors named something sensor.hastats_ebd_* |
|         |sensor.hastats_ebd_total_checksum   - counts sum of grouped-sensors in sensors against total number of sensors and if not 0 then you are missing sensor-count for one "entity-type"|

Using history-explorer-graph with long-term statistics enabled, so the configured sensor with long term statistics enabled are visible.
<br />
<br />
<br />

## HAstats-YAML line count
|Card preview | Card |Config  |
| --------| ------------ |----- |
|<img width="267" alt="image" src="https://user-images.githubusercontent.com/96014323/213894001-746ff150-d97b-44ce-b7d4-06a3b5f9f83e.png"> |[HAstats_yaml_lines_card](https://github.com/ArveVM/HomeAssistantConfig4/blob/master/avm_yaml/dashboard/solutions/hastats_yaml_lines_card.yaml) |


|Input    | Created      | 
| --------| ------------ |
|n/a      |sensor.hastats_yaml_line_total_count - count of lines within all .yaml files on my HA <br />sensor.hastats_yaml_line_avm_yaml_count - counts of lines within folder avm_yaml <br /> hastats_yaml_line_dashboard_count

- Using history-explorer-graph with long-term statistics enabled, so the configured sensor with long term statistics enabled are visible.
- Please note that YAML-count includes empty lines and comments,,, but I'll further invest in using .md and not yaml for comments,, so it will get realistic sometime in the future.

<br />
<br />
<br />

## HAstats-DB
|Card preview | Card |Config  |
| --------| ------------ |----- |
|<img width="271" alt="image" src="https://user-images.githubusercontent.com/96014323/213894282-bc827093-113c-4884-a75d-47bc3b38f1ff.png"> |[HAstats_db_card](https://github.com/ArveVM/HomeAssistantConfig4/blob/master/avm_yaml/dashboard/solutions/hastats_db_card.yaml) |
|[hastats_db.yaml](https://github.com/ArveVM/HomeAssistantConfig4/blob/master/avm_yaml/packages/solutions/hastats_db.yaml)|


|Input    | Created      | 
| --------| ------------ |
|n/a      |sensor.hastats_db_size - track size of physical database-file in MB|

- Using history-explorer-graph with long-term statistics enabled, so the configured sensor with long term statistics enabled are visible.
<br />
<br />
<br />




## Requirements/install tips:
<details>
  <summary> Click to unfold list of booring requirements, tips etc </summary>
  
  #### Functionality required (other than what is builtin in my version of HA):
  - HACS-frontend: Mushroom
  - HACS-frontend: Tabbed-card
  - HACS-frontend: Browser mod2 - for popup-functionality (now updated to browser_mod v2)
  - HACS-frontend: Auto-entities
  - HACS-frontend: History-explorer-card
  - Hacs-int; start_time
    
  #### Optional:
  - Dashboard:
    * yaml-dashboard (but you can copy dashboard-code to UI-dashboard/card 
  
  <br />
 
  #### To install you should:
  - first set up packages/solutions as specified elsewhere in my brilliant documentation. 
  - then copy the 'solutions.yaml'-file specified below into a folder where it will be loaded as part of packages at next restart
  - copy and insert code for card whereever suitable for your installation
  - redo/change to your naming standards  :)
  
  <br />
  
  #### template-editor test-code:
  (because HA-team is constantly adding new functionality/domains,, it is useful to get to check/verify that we actually got all configured with sensors,,,)
```ruby
_____________________________________________________________________
Stats of how many entities pr domain are in my HA-instance, by ArveVM


# check ONE specific domain:
   Automations =  {{ states.automation | count}}

# check ALL domain:
   {%- for domain in states | map(attribute='domain') | unique %}
   {{ domain ~ 's : ' ~ states[domain] | count }}
   {%- endfor %}
   {{ '  Total: ' ~ states | count }}     
```
  
  <br />

  #### Other info:
  nah,,
  
  
</details>
<br />
<br />
<br />


## Credits/inspiration:
- https://community.home-assistant.io/t/lazy-mans-entity-count-something-screwy/174886
- Erlend Sellie's notions of "+10' lines config" - trigger "how big is mine?" - and if I end up with +400 automations - I can look back and see when it happened ;)


## improvements planned/project queue:
- might want to move the system_monitor.yaml sensors here (as there is no config of the integration)
- get some way to add yaml-sensors to statistics-graph (like the template-sensors with class measurement
- change 'float(default=0)'  to 'float(0)'    - no reason to keep the default ?
- change to monthly graphs when I get several months of data   (or just keep floating line?? )
