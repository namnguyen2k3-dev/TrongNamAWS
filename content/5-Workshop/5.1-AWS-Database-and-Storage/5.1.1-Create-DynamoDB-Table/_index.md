---
title : "Create DynamoDB Table"
date : "`r Sys.Date()`"
weight : 1
chapter : false
pre : " <b> 5.1.1 </b> "
---

The DynamoDB table will act as the storage layer for all AI-generated balance configurations.

### Steps

1. Go to the **AWS Console**, search for the **DynamoDB** service, and select **Create table**.

   ![Create DynamoDB](/images/aws_project/createdynamodb.png)

2. In the **Create table** interface, fill in the following important parameters:
   - **Table name**: Enter `GameConfigDB`.
   - **Partition key**: Enter `ConfigID` with the data type as `String`. This will serve as a unique UUID for each AI invocation.

   ![Create DynamoDB 2](/images/aws_project/createdynamodb(2).png)

3. Scroll down, leave the **Default settings** checked, and click **Create table**. The table creation process will complete in a few seconds.

   ![Create DynamoDB 3](/images/aws_project/createdynamodb(3).png)
