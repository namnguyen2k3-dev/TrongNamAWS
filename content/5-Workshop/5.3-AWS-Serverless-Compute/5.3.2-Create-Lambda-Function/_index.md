---
title : "Create Lambda Function"
date : "`r Sys.Date()`"
weight : 2
chapter : false
pre : " <b> 5.3.2 </b> "
---

Now we create the compute function that will handle the business logic.

### Steps

1. Go to the **AWS Console**, search for **Lambda**, and select **Create function**.
2. In the setup wizard:
   - **Author from scratch**: Select this option.
   - **Function name**: Enter `GameConfigProcessor`.
   - **Runtime**: Select `.NET 10 (C#)`.

   ![Create Function 1](/images/aws_project/T%E1%BA%A1o%20Function%20Lambda.png)

3. Under **Permissions**, select **Use an existing role** and choose the IAM role you created in the previous step.
4. Click **Create function**. 

   ![Create Function 2](/images/aws_project/T%E1%BA%A1o%20Function%20Lambda-xong.png)
