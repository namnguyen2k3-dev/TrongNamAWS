---
title : "Tạo IAM Role"
date : "`r Sys.Date()`"
weight : 1
chapter : false
pre : " <b> 5.3.1 </b> "
---

Hàm Lambda cần quyền truy cập để ghi vào DynamoDB, lưu file lên S3, và gọi API sang Amazon Bedrock. Chúng ta sẽ tạo một IAM Role.

### Các bước thực hiện

1. Truy cập **AWS Console**, tìm kiếm **IAM**, chọn **Roles**.

   ![IAM 1](/images/aws_project/t%E1%BA%A1o%20quy%E1%BB%81n%20truy%20c%E1%BA%ADp%20Quicklinks%20IAM.png)
   ![IAM 2](/images/aws_project/t%E1%BA%A1o%20quy%E1%BB%81n%20truy%20c%E1%BA%ADp%20Quicklinks%20IAM(2).png)
2. Nhấn **Create role**. Ở phần Trusted entity type, chọn **AWS service**, Use case chọn **Lambda**.
3. Tại trang **Add permissions**, tìm và tick chọn các chính sách (policy) sau:
   - `AmazonDynamoDBFullAccess`
   - `AmazonS3FullAccess`
   - `AmazonBedrockFullAccess`
   - `AWSLambdaBasicExecutionRole` (thường có sẵn)

   ![IAM Permissions 1](/images/aws_project/add%20permisssions.png)
   ![IAM Permissions 2](/images/aws_project/add%20permisssions%202(bedrock).png)
   ![IAM Permissions 3](/images/aws_project/add%20permisssions%20s3-lambda.png)
   ![IAM Permissions 4](/images/aws_project/add%20permisssions%20s3-lambda(2).png)

4. Riêng với Claude 4.5 được cấp qua Global Inference Profile (CRIS), ta cần cấp quyền `bedrock:InvokeModel` mở rộng. Nhấn **Add permissions -> Create inline policy**.

   ![IAM Global CRIS 1](/images/aws_project/C%E1%BA%A5p%20quy%E1%BB%81n%20Global%20CRIS%20cho%20Lambda%20trong%20AWS%20IAM.png)
   ![IAM Global CRIS 2](/images/aws_project/C%E1%BA%A5p%20quy%E1%BB%81n%20Global%20CRIS%20cho%20Lambda%20trong%20AWS%20IAM(1).png)
   ![IAM Global CRIS 3](/images/aws_project/C%E1%BA%A5p%20quy%E1%BB%81n%20Global%20CRIS%20cho%20Lambda%20trong%20AWS%20IAM(2).png)

5. Sử dụng JSON editor, dán quyền cho phép gọi model `global.*`, đặt tên policy và lưu lại.

   ![IAM Global CRIS 3](/images/aws_project/C%E1%BA%A5p%20quy%E1%BB%81n%20Global%20CRIS%20cho%20Lambda%20trong%20AWS%20IAM(3).png)
