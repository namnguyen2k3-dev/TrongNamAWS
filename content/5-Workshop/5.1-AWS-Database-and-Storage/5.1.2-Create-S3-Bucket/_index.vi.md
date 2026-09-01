---
title : "Tạo S3 Bucket"
date : "`r Sys.Date()`"
weight : 2
chapter : false
pre : " <b> 5.1.2 </b> "
---

Amazon S3 sẽ được sử dụng để lưu trữ các tệp JSON cấu hình do AI sinh ra, giúp Client Unity tải trực tiếp mà không làm nghẽn API Gateway.

### Các bước thực hiện

1. Truy cập **AWS Console**, tìm kiếm **S3** và chọn **Create bucket**.

2. Tại trang **Create bucket**, điền các thông tin sau:
   - **Bucket name**: Nhập `cloud-game-cms-2026` (hoặc tên duy nhất bất kỳ).
   - **AWS Region**: Chọn `ap-southeast-1` (Singapore).

   ![Tạo S3 Bucket 1](/images/aws_project/s3-create-bucket(1).png)

3. Ở phần **Object Ownership**, giữ nguyên vô hiệu hóa ACLs (khuyên dùng). Bỏ tick ô **Block all public access** nếu bạn muốn các file JSON có thể được tải về công khai từ Unity. Xác nhận cảnh báo và nhấn **Create bucket**.

   ![Tạo S3 Bucket 2](/images/aws_project/s3-create-bucket(2).png)
