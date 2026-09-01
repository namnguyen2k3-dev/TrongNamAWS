---
title : "Phân quyền S3 Policy"
date : "`r Sys.Date()`"
weight : 3
chapter : false
pre : " <b> 5.1.3 </b> "
---

Để cho phép Client Unity WebGL đọc được các file JSON, chúng ta phải cấu hình Bucket Policy cấp quyền đọc công khai.

### Các bước thực hiện

1. Bấm vào Bucket vừa tạo, chuyển sang tab **Permissions**.

2. Cuộn xuống phần **Bucket policy** và nhấn **Edit**.

3. Dán đoạn mã JSON sau đây vào ô (đảm bảo thay ARN bằng ARN thực tế của bucket bạn):
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

4. Nhấn **Save changes**. Bucket lúc này sẽ hiển thị nhãn "Publicly accessible".

   ![S3 Bucket Policy](/images/aws_project/s3-bucket-policy.png)
