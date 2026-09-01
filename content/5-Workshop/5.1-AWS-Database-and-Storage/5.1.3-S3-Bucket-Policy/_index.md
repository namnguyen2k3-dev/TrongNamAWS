---
title : "S3 Bucket Policy"
date : "`r Sys.Date()`"
weight : 3
chapter : false
pre : " <b> 5.1.3 </b> "
---

To allow the Unity WebGL client to read the JSON files, we must configure a Bucket Policy that grants public read access.

### Steps

1. Select your newly created bucket and navigate to the **Permissions** tab.

2. Scroll down to the **Bucket policy** section and click **Edit**.

3. Paste the following JSON policy, ensuring you replace the ARN with your actual bucket ARN:
   ```json
   {
       "Version": "2012-10-17",
       "Statement": [
           {
               "Sid": "PublicReadGetObject",
               "Effect": "Allow",
               "Principal": "*",
               "Action": "s3:GetObject",
               "Resource": "arn:aws:s3:::cloud-game-cms-2026/*"
           }
       ]
   }
   ```

4. Click **Save changes**. The bucket should now display a "Publicly accessible" badge.

   ![S3 Bucket Policy](/images/aws_project/s3-bucket-policy.png)
