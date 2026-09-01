---
title : "Lambda Proxy"
date : "`r Sys.Date()`"
weight : 2
chapter : false
pre : " <b> 5.4.2 </b> "
---

By defining the integration in the previous step, API Gateway is now configured to act as a Proxy. 

### Steps

1. Continue the API creation wizard. In the **Define stages** step, leave the **Stage name** as `$default` and ensure **Auto-deploy** is checked. Click **Next**.
2. Review your settings and click **Create**.
3. Once created, select **Routes** from the left navigation pane. You will see the `POST /GameConfigProcessor` route directly linked to your Lambda function.
4. Any JSON payload sent from Unity to this API endpoint will be forwarded completely unmodified to the Lambda function.

   ![Lambda Integration](/images/aws_project/api_integration.png)
