---
title : "Create HTTP API"
date : "`r Sys.Date()`"
weight : 1
chapter : false
pre : " <b> 5.4.1 </b> "
---

For a game server, HTTP APIs are 71% cheaper, up to 60% faster, and easier to integrate with Lambda Proxy than traditional REST APIs.

### Steps

1. Go to the **AWS Console**, search for **API Gateway**, and click **Build** under the **HTTP API** section.

   ![Create API](/images/aws_project/create-http-api-gateway.png)

2. In the **Create an API** step, click **Add integration**. Select **Lambda** from the dropdown menu.
3. Choose the AWS Region where your Lambda is located, and select the `GameConfigProcessor` function you created earlier.
4. Give your API a name (e.g., `GameServerAPI`) and click **Next**.

   ![Create API 2](/images/aws_project/create-http-api-gateway-1.png)

5. In the **Configure routes** step, set the **Method** to `POST` and the **Resource path** to `/GameConfigProcessor`. Click **Next**.

   ![Create API 3](/images/aws_project/create-http-api-gateway-2.png)
   ![Create API 4](/images/aws_project/create-http-api-gateway-3.png)
   ![Create API 5](/images/aws_project/create-http-api-gateway-4.png)
