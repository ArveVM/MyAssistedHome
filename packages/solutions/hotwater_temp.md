                                                  ArveVM, October.2022
# Hotwater Temperature

<br />

## Intro:
### Why Hotwater Temperature??  
Splitting hotwater-control in several packages,, and this particular looks at the setting for hotwater boiler


### Credits/inspiration/appraisal:
From me:

To me:
- If you find this Solution/info just the slightest bit of usefull, if you copy it or learn something from it, please give me "a pat on the back" in the form of adding to my Github-scoring, by pressin the STAR in the top right corner of my Github-repo (top right on this page)
  - and if the solution is built on other peoples ideas (see above) - they are most likely wort a STAR as well :=) )



### Requirements/install tips/troubleshooting:
<details>
  <summary> Click to unfold list of booring requirements, tips etc </summary>
  
  #### Functionality required (other than what is builtin in my version of HA):
  - HACS: browser mod - for popup-functionality (now updated to browser_mod v2)
  - HACS: custom:button-card
  - HACS: custom:auto-entities
  - HACS: custom:fold-entity-row
  - HACS: custom:multiple-entity-row
  Optional
  - Dashboard:
    * yaml-dashboard (but you can copy dashboard-code to UI-dashboard/card 

  <br />
 
  #### To install you should:
  - first set up packages/solutions as specified elsewhere in my brilliant documentation. 
  - then copy the 'solutions.yaml'-file specified below into a folder where it will be loaded as part of packages at next restart
  - copy and insert code for card whereever suitable for your installation
  - redo/change to your naming standards  :)

  - setup Priceanalyzer-integration with following "Settings for custom degrees for HotWater sensor":
  ```ruby
  {"default_temp": 75, "five_most_expensive": 40, "is_falling": 50, "five_cheapest": 65, "ten_cheapest": 50, "low_price": 60, "not_cheap_not_expensive": 50, "min_price_for_day": 80}
  ```
  <br />
  
  #### template-editor test-code:
  nah,,
 
  <br />
  <br />
  
  #### Other info:
  Mix- screw temp:
  
  <img width="482" alt="image" src="https://user-images.githubusercontent.com/96014323/205517869-71947bc4-9ae0-4f60-859d-e8aca934ac24.png">

  <br />
  <br />
  
  Pipe-out temp:
  
  <img width="851" alt="image" src="https://user-images.githubusercontent.com/96014323/205517898-eb2a5ed1-af07-470b-94c5-203b66527f60.png">

  <br />
  <br />
  
  Bottom temp:
  
  <img width="288" alt="image" src="https://user-images.githubusercontent.com/96014323/205518063-edaefe4b-dc82-4f98-871b-f48d11100cfc.png">

  
  
</details>

<br />
<br />

## How it works (for me):
- The Priceanalyzer integration get hourly Nordpool-spot prices for electricity 
In the configuration of Priceanalyzer I've set some guiding for VVB-temp, so PriceAnalyzer_VVB will create target temperatures according to prices
- Option of turning Auto OFF - which means that local control should be managed by VVB
- Option of PowerHoursave, cut heating for rest of hour to stay within hourly limit (tarrif-limit)
- etc


<br />
<br />

### Solution-Yaml:
[Hotwater temp](https://github.com/ArveVM/HomeAssistantConfig4/blob/master/avm_yaml/packages/solutions/hotwater_temp.yaml)

<br />
<br />

### Solution-Dashboard(s):
[Hotwater card](https://github.com/ArveVM/HomeAssistantConfig4/blob/master/avm_yaml/dashboard/cards/hotwater_card.yaml))

<img width="287" alt="image" src="https://user-images.githubusercontent.com/96014323/212564221-410bb893-91ee-452d-8904-f2b59298876c.png">
click on the chip - and you will get pop-up-card with more details:

<br />
<br />


## improvements planned/project queue:
- better dashboard
- add acceptable quality on history graph to popup,,,
- must also create legionella warning
