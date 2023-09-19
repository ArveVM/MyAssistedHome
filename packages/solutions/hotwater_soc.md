                                                  ArveVM, October.2022
# Hotwater State of Charge (SoC)

<br />

## Intro:
### Why Hotwater SoC??  
Splitting hotwater-control in several packages,, and this particular looks at the State of Charge
- State of Charge in %
- Time to charge full

### Credits/inspiration/appraisal:
From me:
- Asbjørn Bergsland have shared a lot of formulas/code/screenshots 
  - Which i shamelessly copied, re-named to my naming convention, and created my 'Solution'
  - Created inpust for temps, tank sice and heating-element sixe which now are editable from UI, but all intelligence and calculations come from Asbjørn: so hjuge thanks ;)

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

  <br />
  
  #### template-editor test-code:
  nah,,
  you can contact Asbjørn  :)

  <br />

  #### Other info:
  check this calculator; https://bloglocation.com/art/water-heating-calculator-for-time-energy-power
  
  
</details>

<br />
<br />

## How it works (for me):
Created dashboard-chip:
- to see SoC% and currentTemp
- with popup-functionality:
  - Target-temp/current
  - chargetime to SoC-target
  - energy toBeCharged 
    - EnergyMax, 100% charged tank
    - Charged (energy used to charge tank to current status) 
    - toBeCharged 
  - SoC-settings:
    - SoC-target
    - SoC-min (consider temp when hotwater is not actually defined as hotwater)
    - intake-temp (water temp into hotwater-tank
    - Tank size
    - Tank emement size  
  - History grap  (first version,, enough today,,)

<br />
<br />

### Solution-Yaml:
[hotwater_soc.yaml](hotwater_soc.yaml)
- input-number for target temp 
- input-number for min temp
- input-number of tank-sice
- input-number of heater-element sice
- a bunch of sensors created to track: 
  - max capacity of kWh chargable to the tank
  - current state kWh
  - kWh that can be charged
  - SoC in %

<br />
<br />

### Solution-Dashboard(s):
[Hotwater SoC chip](https://github.com/ArveVM/MyAssistedHome/blob/master/dashboard/cards/hotwater_soc_chip.yaml)

<img width="88" alt="image" src="https://user-images.githubusercontent.com/96014323/193773226-887a50c5-87e2-4641-93d8-b29f8be2b8e9.png">

click on the chip - and you will get pop-up-card with more details:

[Hotwater SoC card](https://github.com/ArveVM/MyAssistedHome/blob/master/dashboard/cards/hotwater_soc_card.yaml)

<br />

<img width="237" alt="image" src="https://user-images.githubusercontent.com/96014323/194163431-6e819073-f961-4de4-abe7-53352f2ce04c.png">

<br />

with all lines expanded:

<img width="235" alt="image" src="https://user-images.githubusercontent.com/96014323/195613384-1c3a8885-a3bc-406f-8072-02e1f058e487.png">


<br />
<br />


## improvements planned/project queue:
- new average temp, must check differance between temp-sensor on mixer and the one in the bottom of the tank
- add acceptable quality on history graph to popup,,,
- must also create legionella warning

