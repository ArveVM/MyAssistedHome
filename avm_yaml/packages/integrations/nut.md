                                                  ArveVM, 13.oct.2022
# Network UPS Tools (NUT)-integration
[Official HA-documentation](https://www.home-assistant.io/integrations/nut/)




## How I use this integration:  

# my devices: 
---
---

---

## Setup:
- Prereqs:
  - physical UPS, connected to server
  - NUT-plugin installed on unRaid-server
    - monitor-user/username defined
    - scan for ups'
    - save and start plugin
  - HA:
    - add NUT-integration:
      - use IP of undaid-server, 
      - use default port
      - use defined monitor-user/pwd
    - go through new entities to add/enable what you want 




## toDo / plans ahead:
- Add warning if lost power more than 5 sec?
- add critical alert if lost power more than 30 sec?
- add server/vm/dockers auto-shutdown