---
title : "Week 11 WorkLog"
date : "`r Sys.Date()`"
weight : 11
chapter : false
pre : " <b> 1.11 </b> "
---

### Week 11 Objectives:  
  
  - Conduct End-to-End testing of the entire architecture (Unity → API Gateway → Bedrock → S3 → Unity).  
  - Debug and fix issues found in the production environment.  
  - Study CloudWatch Logs analysis and Global Inference Profile.  
  
### Tasks to be completed this week:  
  
  | Day | Task                                                                         | Start Date   | Completion Date | Reference                              |
|-----:|------------------------------------------------------------------------------|--------------|-----------------|---------------------------------------|
| 2    | End-to-End test the full flow: Unity → API Gateway → Lambda → Bedrock        | 21/09/2026   | 21/09/2026      |                                       |
| 3    | Debug `500 Internal Server Error` by analyzing Amazon CloudWatch Logs        | 22/09/2026   | 22/09/2026      | https://docs.aws.amazon.com/cloudwatch/ |
| 4    | Fix Lambda Timeout issue (increase from 15s to 30s for Bedrock inference)    | 23/09/2026   | 23/09/2026      | https://docs.aws.amazon.com/lambda/    |
| 5    | Fix missing InvokeModel permission on the Lambda IAM Role                    | 24/09/2026   | 24/09/2026      | https://cloudjourney.awsstudygroup.com/ |
| 6    | Study Global Inference Profile (CRIS) for cross-region model invocation      | 25/09/2026   | 26/09/2026      | https://docs.aws.amazon.com/bedrock/   |
  
### Results Achieved in Week 11:  
  
  - Successfully completed End-to-End testing of the entire system architecture.  
  - Fixed the Lambda Timeout error and missing InvokeModel permission.  
  - Understood how to use Global Inference Profile to call Claude models cross-Region.
