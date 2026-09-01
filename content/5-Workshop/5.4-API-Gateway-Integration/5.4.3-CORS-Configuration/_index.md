---
title : "CORS Configuration"
date : "`r Sys.Date()`"
weight : 3
chapter : false
pre : " <b> 5.4.3 </b> "
---

The final and most crucial step for Unity WebGL to call the API without being blocked by the browser (Cross-Origin error) is enabling CORS on API Gateway.

### Steps

1. In the API Gateway console for your HTTP API, select **CORS** from the left navigation pane.
2. Click **Configure**.
3. Set **Access-Control-Allow-Origin** to `*` (or your specific Unity game domain). Click **Add**.
4. Set **Access-Control-Allow-Headers** to `*` or `content-type`. Click **Add**.
5. Set **Access-Control-Allow-Methods** to include `POST` and `OPTIONS`. Click **Add**.
6. Click **Save**. Unity WebGL will now be able to communicate with the AWS server seamlessly.

   ![CORS](/images/aws_project/api_cors.png)
