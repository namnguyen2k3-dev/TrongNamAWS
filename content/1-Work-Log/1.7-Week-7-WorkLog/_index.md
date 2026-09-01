---
title : "Week 7 WorkLog"
date : "`r Sys.Date()`"
weight : 7
chapter : false
pre : " <b> 1.7 </b> "
---

### Week 7 Objectives:  
  
  - Write the C# source code for the Lambda function (`Function.cs`) as the orchestration hub.  
  - Integrate the `Amazon.BedrockRuntime` SDK to invoke Claude 4.5 Haiku.  
  - Build the logic to extract JSON from the `tool_use` block and save to DynamoDB/S3.  
  
### Tasks to be completed this week:  
  
  | Day | Task                                                                        | Start Date   | Completion Date | Reference                              |
|-----:|-----------------------------------------------------------------------------|--------------|-----------------|---------------------------------------|
| 2    | Write the System Prompt for Claude to analyze Player Telemetry (HP, DPS)     | 24/08/2026   | 24/08/2026      | https://docs.anthropic.com/            |
| 3    | Define the Tool Use JSON schema for BossConfig (ATK, DEF, MoveSpeed, CD)     | 25/08/2026   | 25/08/2026      | https://docs.aws.amazon.com/bedrock/   |
| 4    | Write `Function.cs`: integrate API Gateway → Bedrock → S3                    | 26/08/2026   | 27/08/2026      | https://docs.aws.amazon.com/lambda/    |
| 5    | Install `Amazon.BedrockRuntime` SDK, implement tool_use block extraction     | 27/08/2026   | 28/08/2026      | https://docs.aws.amazon.com/bedrock/   |
| 6    | Write logic to save AI config to DynamoDB Table and upload JSON to S3        | 28/08/2026   | 29/08/2026      | https://docs.aws.amazon.com/dynamodb/  |
  
### Results Achieved in Week 7:  
  
  - Completed the C# `Function.cs` source code handling API Gateway → Bedrock → S3 flow.  
  - Successfully integrated BedrockRuntime SDK to invoke Claude 4.5 Haiku via Tool Use.  
  - Built accurate JSON extraction logic from the `tool_use` block, preventing data parse errors.
