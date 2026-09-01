---
title : "Khởi tạo Lambda"
date : "`r Sys.Date()`"
weight : 2
chapter : false
pre : " <b> 5.3.2 </b> "
---

Giờ là lúc tạo hàm tính toán Serverless để xử lý logic backend.

### Các bước thực hiện

1. Truy cập **AWS Console**, tìm **Lambda** và chọn **Create function**.
2. Tại màn hình cài đặt:
   - Chọn **Author from scratch**.
   - **Function name**: Nhập `GameConfigProcessor`.
   - **Runtime**: Chọn `.NET 10 (C#)`.

   ![Tạo Function 1](/images/aws_project/T%E1%BA%A1o%20Function%20Lambda.png)

3. Tại phần **Permissions**, thả phần **Change default execution role** ra, chọn **Use an existing role** và chọn cái tên Role bạn đã tạo ở bước trước.
4. Nhấn **Create function**.

   ![Tạo Function 2](/images/aws_project/T%E1%BA%A1o%20Function%20Lambda-xong.png)
