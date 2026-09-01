---
title : "Deploy and Configure"
date : "`r Sys.Date()`"
weight : 4
chapter : false
pre : " <b> 5.3.4 </b> "
---

After writing the code, we must compile it, upload it to AWS, and configure the timeout.

### Steps

1. In your local IDE (Visual Studio / Rider), build the .NET project and package it into a `.zip` file.

   ![Tạo zip 1](/images/aws_project/t%E1%BA%A1o%20.zip.png)
   ![Tạo zip 2](/images/aws_project/%C4%91%C3%B3ng%20g%C3%B3i%20.zip-test.png)
   ![Tạo zip 3](/images/aws_project/%C4%91%C3%B3ng%20g%C3%B3i%20zip%202%20.png)
2. In the AWS Lambda Console, select the **Code** tab.
3. Click **Upload from** -> **.zip file** and select your zipped project.

   ![Upload Code](/images/aws_project/update_src_code%20.zip.png)
   ![Update Complete](/images/aws_project/Update_complete.png)

4. Scroll down to **Runtime settings** and click **Edit**. Change the **Handler** to `GameConfigProcessor::GameConfigProcessor.Function::FunctionHandler`.

   ![Handler](/images/aws_project/handler.png)

5. Switch to the **Configuration** tab, then select **General configuration**.
6. Click **Edit**. Change the **Timeout** from 3 seconds to **30 seconds**. 
   *Why?* Bedrock AI processing and .NET Cold Starts can take several seconds. A 3-second timeout would kill the function before it finishes!

   ![Timeout](/images/aws_project/lambda_timeout.png)
