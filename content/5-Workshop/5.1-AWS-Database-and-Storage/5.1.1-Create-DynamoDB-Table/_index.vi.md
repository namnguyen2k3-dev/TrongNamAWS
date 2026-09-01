---
title : "Tạo bảng DynamoDB"
date : "`r Sys.Date()`"
weight : 1
chapter : false
pre : " <b> 5.1.1 </b> "
---

Bảng DynamoDB sẽ đóng vai trò lưu trữ toàn bộ lịch sử các cấu hình cân bằng mà AI sinh ra.

### Các bước thực hiện

1. Truy cập vào **AWS Console**, tìm kiếm dịch vụ **DynamoDB** trên thanh tìm kiếm và chọn **Create table**.

   ![Tạo DynamoDB](/images/aws_project/createdynamodb.png)

2. Tại giao diện **Create table**, điền các thông số quan trọng sau:
   - **Table name**: Nhập `GameConfigDB`.
   - **Partition key**: Nhập `ConfigID` với kiểu dữ liệu là `String`. Đây sẽ là ID duy nhất (UUID) cho mỗi lần gọi AI.

   ![Tạo DynamoDB 2](/images/aws_project/createdynamodb(2).png)

3. Kéo xuống dưới, giữ nguyên các cài đặt **Default settings** và nhấn **Create table**. Quá trình tạo bảng sẽ hoàn tất trong vài giây.

   ![Tạo DynamoDB 3](/images/aws_project/createdynamodb(3).png)
