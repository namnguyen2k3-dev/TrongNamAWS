---
title : "WorkLog Tuần 8"
date : "`r Sys.Date()`"
weight : 8
chapter : false
pre : " <b> 1.8 </b> "
---

### Mục tiêu tuần 8:  
  
  - Đóng gói mã nguồn .NET và triển khai (deploy) lên AWS Lambda.  
  - Cấu hình API Gateway với Lambda Proxy Integration và bật CORS.  
  - Thiết lập IAM Role đầy đủ quyền cho Lambda truy cập S3, DynamoDB, Bedrock.  
  
### Các công việc cần triển khai trong tuần này:  
  
  | Thứ | Công việc                                                                | Ngày bắt đầu | Ngày hoàn thành | Nguồn tài liệu                        |
|-----:|--------------------------------------------------------------------------|--------------|-----------------|---------------------------------------|
| 2    | Đóng gói ứng dụng .NET thành file .zip và deploy lên AWS Lambda          | 31/08/2026   | 31/08/2026      | https://docs.aws.amazon.com/lambda/    |
| 3    | Cấu hình HTTP API Gateway với Lambda Proxy Integration                   | 01/09/2026   | 01/09/2026      | https://cloudjourney.awsstudygroup.com/ |
| 4    | Bật cấu hình CORS trên API Gateway cho Unity WebGL gọi API              | 02/09/2026   | 02/09/2026      | https://cloudjourney.awsstudygroup.com/ |
| 5    | Cấu hình IAM Role cho Lambda: s3:PutObject, dynamodb:PutItem, bedrock:InvokeModel | 03/09/2026 | 03/09/2026 | https://cloudjourney.awsstudygroup.com/ |
| 6    | Test API bằng Postman/curl và kiểm tra kết quả trên CloudWatch Logs     | 04/09/2026   | 05/09/2026      | https://docs.aws.amazon.com/cloudwatch/ |
  
### Kết quả đạt được tuần 8:  
  
  - Deploy thành công Lambda Function chạy .NET lên môi trường AWS.  
  - Cấu hình API Gateway hoạt động đúng với Lambda Proxy Integration và CORS.  
  - Test thành công luồng API: gửi request → nhận response JSON từ Bedrock.
