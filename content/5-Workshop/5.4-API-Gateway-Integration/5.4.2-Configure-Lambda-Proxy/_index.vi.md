---
title : "Kết nối Lambda"
date : "`r Sys.Date()`"
weight : 2
chapter : false
pre : " <b> 5.4.2 </b> "
---

Nhờ việc chọn Integration ở bước trước, API Gateway giờ đây đóng vai trò là một Proxy trung gian.

### Các bước thực hiện

1. Tiếp tục trình hướng dẫn tạo API. Ở bước **Define stages**, giữ nguyên **Stage name** là `$default` và đảm bảo ô **Auto-deploy** được tick. Nhấn **Next**.
2. Xem lại cấu hình và nhấn **Create**.
3. Sau khi tạo xong, chọn mục **Routes** ở thanh điều hướng bên trái. Bạn sẽ thấy Route `POST /GameConfigProcessor` đã được trỏ trực tiếp về hàm Lambda của bạn.
4. Mọi JSON payload gửi từ Unity lên đường dẫn API này sẽ được chuyển tiếp nguyên vẹn sang hàm Lambda.

   ![Tích hợp Lambda](/images/aws_project/api_integration.png)
