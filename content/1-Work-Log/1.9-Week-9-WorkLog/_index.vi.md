---
title : "WorkLog Tuần 9"
date : "`r Sys.Date()`"
weight : 9
chapter : false
pre : " <b> 1.9 </b> "
---

### Mục tiêu tuần 9:  
  
  - Import AWS SDK for .NET vào Unity project (AdaptiveBossAI).  
  - Viết script sử dụng `UnityWebRequest` gửi thông số chiến đấu lên API Gateway.  
  - Xây dựng cơ chế parse JSON response và xử lý exception an toàn.  
  
### Các công việc cần triển khai trong tuần này:  
  
  | Thứ | Công việc                                                                | Ngày bắt đầu | Ngày hoàn thành | Nguồn tài liệu                        |
|-----:|--------------------------------------------------------------------------|--------------|-----------------|---------------------------------------|
| 2    | Import bộ thư viện AWS SDK for .NET vào thư mục Plugins của Unity        | 07/09/2026   | 07/09/2026      | https://docs.aws.amazon.com/sdk-for-net/ |
| 3    | Cài đặt và cấu hình môi trường phát triển Unity (Visual Studio, Git)    | 08/09/2026   | 08/09/2026      |                                       |
| 4    | Viết script UnityWebRequest gửi Player Telemetry lên API Gateway        | 09/09/2026   | 10/09/2026      | https://docs.unity3d.com/              |
| 5    | Xây dựng logic parse JSON response (AIBossResponse) từ API              | 10/09/2026   | 11/09/2026      | https://docs.unity3d.com/              |
| 6    | Viết cơ chế try-catch xử lý exception khi parse JSON từ S3              | 11/09/2026   | 12/09/2026      |                                       |
  
### Kết quả đạt được tuần 9:  
  
  - Tích hợp thành công AWS SDK vào Unity project.  
  - Viết xong script gửi Player Telemetry và nhận Boss Config từ API Gateway.  
  - Xây dựng cơ chế xử lý lỗi an toàn khi parse dữ liệu JSON từ backend.
