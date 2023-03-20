                                                  ArveVM, November.2022
# my ToDo

<br />

## Intro:
### Why ToDo in HA? 
- Just to gather all the "chores" or active tasks one should do, I created the ToDo
- idea from app with chores, and from Remi's dashboard
- so now i can automate things to do, or schedules,, and makes sure that they are done  ;)

Focus so far have been on: 
- Getting one place to see if there are tasks that should have been done
- possibility to check off tasks
- only show task-list when there are tasks

### Credits/inspiration:
- Remi, [theawsomegarage](https://theawesomegarage.com/)  - the article on dashboard with popups - it also had a version of todo ;)

### Requirements/install tips:
<details>
  <summary> Click to unfold list of booring requirements, tips etc </summary>
  
  #### Functionality required (other than what is builtin in my version of HA):
  - HACS: browser mod - for popup-functionality (now updated to browser_mod v2)
  - HACS: custom:button-card
  - HACS: custom:auto-entities
  
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
  nah,,
  
  <br />

  #### Other info:
  nah,,
  
  
</details>

<br />
<br />

## How it works (for me):
- Initial setup:
  - Set up template sensor counting all Input Boolean's with name that ends on _todo
  - Card that filters on Input Boolean's with name that ends on _todo, showing only them
    - using entity filter - to show only those sensors that are ON
    - using conditional, so if count of tasks ON = 0,, then don't show icon at all
- Add todo-task:
  - For new solution, create a Input Boolean named _todo as last part of name
  - Add automation or other conditions to tick the Boolean to ON, ant it will be counted by the todo-counter, and show on the todo-list

<br />
<br />

### Solution-Yaml:
[todo.yaml](todo.yaml)
- create template sensor with counter 

<br />
<br />

### Solution-Dashboard(s):
[chip_todo.yaml](https://github.com/ArveVM/HomeAssistantConfig4/blob/master/avm_yaml/dashboard/cards/chip_todo.yaml)

First a little "chip",, it is conditional, so not showing if not

<img width="34" alt="image" src="https://user-images.githubusercontent.com/96014323/200069238-fc690ec6-0906-4e30-97ac-4ed030c75cba.png">

<br />

on click:

<img width="224" alt="image" src="https://user-images.githubusercontent.com/96014323/200069443-af889bbc-06ce-4e61-b2ad-f76de935487d.png">

and if you click one of the entities,, the task is completed and it disapears,,


<br />
<br />


## improvements planned/project queue:
- enable conditional chip to be anywhere on the swipe card?  must currently be at the end, because if conditions are not met - the rest of the cards are also filtered :(




