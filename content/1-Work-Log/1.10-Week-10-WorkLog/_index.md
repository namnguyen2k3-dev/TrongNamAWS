---
title : "Week 10 WorkLog"
date : "`r Sys.Date()`"
weight : 10
chapter : false
pre : " <b> 1.10 </b> "
---

### Week 10 Objectives:  
  
  - Design the Fallback System for scenarios with network loss or high latency.  
  - Implement the `ApplyDDAStats` function to handle transitions between AWS AI and Local Base AI.  
  - Balance the Max/Min Cap values to ensure a stable gaming experience.  
  
### Tasks to be completed this week:  
  
  | Day | Task                                                                       | Start Date   | Completion Date | Reference                              |
|-----:|----------------------------------------------------------------------------|--------------|-----------------|---------------------------------------|
| 2    | Design the Offline Fallback System architecture for the game                | 14/09/2026   | 14/09/2026      |                                       |
| 3    | Implement ApplyDDAStats: handle Online (AWS) / Offline mode transitions     | 15/09/2026   | 16/09/2026      |                                       |
| 4    | Balance Max/Min Caps for Boss stats (ATK, DEF, MoveSpeed, Cooldowns)        | 16/09/2026   | 17/09/2026      |                                       |
| 5    | Test transitions between AWS AI mode and Local Base AI mode                 | 17/09/2026   | 18/09/2026      |                                       |
| 6    | Study Security best practices: API keys, IAM least privilege                | 18/09/2026   | 19/09/2026      | https://cloudjourney.awsstudygroup.com/ |
  
### Results Achieved in Week 10:  
  
  - Completed the Fallback System allowing the game to run stably when disconnected from AWS.  
  - The `ApplyDDAStats` function smoothly transitions between Online and Offline modes.  
  - Boss stats are properly capped, ensuring a balanced gaming experience.
