---
title : "Week 8 WorkLog"
date : "`r Sys.Date()`"
weight : 8
chapter : false
pre : " <b> 1.8 </b> "
---

### Week 8 Objectives:  
  
  - Package the .NET source code and deploy it to AWS Lambda.  
  - Configure API Gateway with Lambda Proxy Integration and enable CORS.  
  - Set up a complete IAM Role for Lambda to access S3, DynamoDB, and Bedrock.  
  
### Tasks to be completed this week:  
  
  | Day | Task                                                                       | Start Date   | Completion Date | Reference                              |
|-----:|----------------------------------------------------------------------------|--------------|-----------------|---------------------------------------|
| 2    | Package the .NET application into a .zip file and deploy to AWS Lambda      | 31/08/2026   | 31/08/2026      | https://docs.aws.amazon.com/lambda/    |
| 3    | Configure HTTP API Gateway with Lambda Proxy Integration                    | 01/09/2026   | 01/09/2026      | https://cloudjourney.awsstudygroup.com/ |
| 4    | Enable CORS on API Gateway for Unity WebGL to call the API                  | 02/09/2026   | 02/09/2026      | https://cloudjourney.awsstudygroup.com/ |
| 5    | Configure IAM Role for Lambda: s3:PutObject, dynamodb:PutItem, bedrock:InvokeModel | 03/09/2026 | 03/09/2026 | https://cloudjourney.awsstudygroup.com/ |
| 6    | Test API using Postman/curl and verify results in CloudWatch Logs           | 04/09/2026   | 05/09/2026      | https://docs.aws.amazon.com/cloudwatch/ |
  
### Results Achieved in Week 8:  
  
  - Successfully deployed the .NET Lambda Function to the AWS environment.  
  - Configured API Gateway correctly with Lambda Proxy Integration and CORS.  
  - Successfully tested the API flow: send request → receive JSON response from Bedrock.
