                                                  ArveVM, November.2022
# Kid S - change linen


## Why Kid S change linen??  
Start of collecting repeatig tasks with warnings and alert. Kid S is a bit irregular in thimes of "now we need to change". 
So this Solution is 
- logging when last changed
- setting for how long between changes
- setting for creating todo or not   (prereq is the ToDo-Solution)
- setting for how far ahead of due-date todo-task should be created
- setting for creating alert if overdue
- calculation of time to change
- card which show how long time until next due-date


Todo-principle copied code from Remi theawsomegarage


## Solution-Yaml:
[kids_linen.yaml](kids_linen.yaml)
- input-booleans, -datetimes, -numbers and template sensor
- automation to turn on todo when limit is reached
- automation to reset date when todo is completed



## Dashboard(s):
Normal usage through the ToDo-solution,, with a chip that indicates there are tasks todo.
<img width="31" alt="image" src="https://user-images.githubusercontent.com/96014323/201039131-ed88de20-0a06-4af2-9f71-80f726025204.png">

click the chip, and you will get the todo-list,, which you can "tick off" when comleted (and they will disappear)

<img width="220" alt="image" src="https://user-images.githubusercontent.com/96014323/201039409-f4dd73f1-7875-4c3f-b0fd-65c2f8bff4f9.png">


---

Settings:
[Card Kid S linen](https://github.com/ArveVM/HomeAssistantConfig4/blob/master/avm_yaml/dashboard/cards/kids_linen.yaml)

<img width="260" alt="image" src="https://user-images.githubusercontent.com/96014323/201038585-95717b70-9814-4c52-b4c7-455594875438.png">

---
Dropdown1 - complete task (same as from todo-list):

<img width="262" alt="image" src="https://user-images.githubusercontent.com/96014323/201038747-e2a58756-64c7-4670-9d53-4ba393039469.png">

---
Dropdown2 - change settings:

<img width="261" alt="image" src="https://user-images.githubusercontent.com/96014323/201038979-085aa7b6-02b2-424f-b2d5-990678c6c677.png">

---


# project queue - improvements planned:
- fix alert side of things
- node anchors and general prefix-text (hastely pulished as input to Remi :) )
- quality check on prereq,, change to new std for folded-prereqs


# Credits/inspiration:
- Remi theawsomegarage, Facebook-group; Home Assistant
 

# prereq:
- browser mod - for popup-functionality
- custom:multiple-entity-row - for multiple entities in one row in a card
- custom:fold-entity-row     - for fold-entity-rows
- UI minimalist - for templates (on chip),, should be easy to remove/adopt to your own themes

# template-editor test-code:
nah,,
