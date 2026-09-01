---
title : "Cấu hình CORS"
date : "`r Sys.Date()`"
weight : 3
chapter : false
pre : " <b> 5.4.3 </b> "
---

Bước cuối cùng và quan trọng nhất để Unity WebGL có thể gọi API mà không bị trình duyệt chặn (lỗi Cross-Origin) là bật CORS trên API Gateway. 

### Các bước thực hiện

1. Tại giao diện API Gateway của HTTP API vừa tạo, chọn **CORS** ở thanh điều hướng bên trái.
2. Nhấn **Configure**.
3. Tại ô **Access-Control-Allow-Origin**, điền `*` (hoặc tên miền chứa game Unity của bạn). Nhấn **Add**.
4. Tại ô **Access-Control-Allow-Headers**, điền `*` hoặc `content-type`. Nhấn **Add**.
5. Tại ô **Access-Control-Allow-Methods**, tick chọn `POST` và `OPTIONS`. Nhấn **Add**.
6. Nhấn **Save**. Giờ đây Client Unity WebGL đã có thể gọi lên Server AWS một cách mượt mà.

   ![CORS](/images/aws_project/api_cors.png)
