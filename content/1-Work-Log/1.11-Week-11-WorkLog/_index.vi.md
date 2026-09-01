---
title : "WorkLog Tuần 11"
date : "`r Sys.Date()`"
weight : 11
chapter : false
pre : " <b> 1.11 </b> "
---

### Mục tiêu tuần 11:  
  
  - Kiểm thử End-to-End toàn bộ luồng kiến trúc (Unity → API Gateway → Bedrock → S3 → Unity).  
  - Debug và khắc phục các lỗi phát sinh trên môi trường Production.  
  - Tìm hiểu thêm về CloudWatch Logs và Global Inference Profile.  
  
### Các công việc cần triển khai trong tuần này:  
  
  | Thứ | Công việc                                                                    | Ngày bắt đầu | Ngày hoàn thành | Nguồn tài liệu                        |
|-----:|------------------------------------------------------------------------------|--------------|-----------------|---------------------------------------|
| 2    | Test End-to-End toàn bộ luồng: Unity → API Gateway → Lambda → Bedrock       | 21/09/2026   | 21/09/2026      |                                       |
| 3    | Debug lỗi `500 Internal Server Error` bằng cách phân tích CloudWatch Logs   | 22/09/2026   | 22/09/2026      | https://docs.aws.amazon.com/cloudwatch/ |
| 4    | Khắc phục lỗi Lambda Timeout (tăng từ 15s lên 30s cho Bedrock inference)    | 23/09/2026   | 23/09/2026      | https://docs.aws.amazon.com/lambda/    |
| 5    | Sửa lỗi thiếu quyền InvokeModel trên IAM Role của Lambda                   | 24/09/2026   | 24/09/2026      | https://cloudjourney.awsstudygroup.com/ |
| 6    | Tìm hiểu Global Inference Profile (CRIS) để gọi model xuyên khu vực       | 25/09/2026   | 26/09/2026      | https://docs.aws.amazon.com/bedrock/   |
  
### Kết quả đạt được tuần 11:  
  
  - Hoàn thành kiểm thử End-to-End thành công toàn bộ kiến trúc hệ thống.  
  - Khắc phục thành công lỗi Lambda Timeout và lỗi thiếu quyền InvokeModel.  
  - Hiểu cách sử dụng Global Inference Profile để gọi model Claude xuyên Region.
