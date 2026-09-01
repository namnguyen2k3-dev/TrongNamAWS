---
title : "Create IAM Role"
date : "`r Sys.Date()`"
weight : 1
chapter : false
pre : " <b> 5.3.1 </b> "
---

The Lambda function needs permission to interact with DynamoDB, S3, and Amazon Bedrock. We will attach an IAM Role to it.

### Steps

1. Go to the **AWS Console**, search for **IAM**, and select **Roles**.

   ![IAM 1](/images/aws_project/t%E1%BA%A1o%20quy%E1%BB%81n%20truy%20c%E1%BA%ADp%20Quicklinks%20IAM.png)
   ![IAM 2](/images/aws_project/t%E1%BA%A1o%20quy%E1%BB%81n%20truy%20c%E1%BA%ADp%20Quicklinks%20IAM(2).png)
2. Click **Create role**. Select **AWS service** as the trusted entity and choose **Lambda** as the use case.
3. In the **Add permissions** page, search and select the following managed policies:
   - `AmazonDynamoDBFullAccess`
   - `AmazonS3FullAccess`
   - `AmazonBedrockFullAccess`
   - `AWSLambdaBasicExecutionRole` (usually added by default)

   ![IAM Permissions 1](/images/aws_project/add%20permisssions.png)
   ![IAM Permissions 2](/images/aws_project/add%20permisssions%202(bedrock).png)
   ![IAM Permissions 3](/images/aws_project/add%20permisssions%20s3-lambda.png)
   ![IAM Permissions 4](/images/aws_project/add%20permisssions%20s3-lambda(2).png)

4. Since Claude 4.5 is provisioned under the Global Inference Profile (CRIS), we might need an inline policy to grant `bedrock:InvokeModel` for the `global.*` ARN. Click **Add permissions -> Create inline policy**.

   ![IAM Global CRIS 1](/images/aws_project/C%E1%BA%A5p%20quy%E1%BB%81n%20Global%20CRIS%20cho%20Lambda%20trong%20AWS%20IAM.png)
   ![IAM Global CRIS 2](/images/aws_project/C%E1%BA%A5p%20quy%E1%BB%81n%20Global%20CRIS%20cho%20Lambda%20trong%20AWS%20IAM(1).png)
   ![IAM Global CRIS 3](/images/aws_project/C%E1%BA%A5p%20quy%E1%BB%81n%20Global%20CRIS%20cho%20Lambda%20trong%20AWS%20IAM(2).png)

5. Use the JSON editor to allow Cross-Region Inference, name the policy, and save it.

   ![IAM Global CRIS 3](/images/aws_project/C%E1%BA%A5p%20quy%E1%BB%81n%20Global%20CRIS%20cho%20Lambda%20trong%20AWS%20IAM(3).png)
