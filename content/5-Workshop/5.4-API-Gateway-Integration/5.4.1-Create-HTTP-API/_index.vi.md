---
title : "Tạo HTTP API"
date : "`r Sys.Date()`"
weight : 1
chapter : false
pre : " <b> 5.4.1 </b> "
---

Vì sao lại chọn **HTTP API** mà không phải REST API? Đối với một Game Server, HTTP API rẻ hơn 71%, độ trễ thấp hơn (nhanh hơn tới 60%) và tích hợp dễ dàng hơn với Lambda Proxy.

### Các bước thực hiện

1. Truy cập **AWS Console**, tìm kiếm **API Gateway**. Tại mục **HTTP API**, nhấn nút **Build**.

   ![Tạo API](/images/aws_project/create-http-api-gateway.png)

2. Tại bước **Create an API**, nhấn **Add integration**. Trong menu thả xuống, chọn **Lambda**.
3. Chọn Region chứa hàm Lambda của bạn, sau đó chọn hàm `GameConfigProcessor` đã tạo ở bước trước.
4. Đặt tên cho API (ví dụ: `GameServerAPI`) và nhấn **Next**.

   ![Tạo API 2](/images/aws_project/create-http-api-gateway-1.png)

5. Tại bước **Configure routes**, thiết lập **Method** là `POST` và **Resource path** là `/GameConfigProcessor`. Nhấn **Next**.

   ![Tạo API 3](/images/aws_project/create-http-api-gateway-2.png)
   ![Tạo API 4](/images/aws_project/create-http-api-gateway-3.png)
   ![Tạo API 5](/images/aws_project/create-http-api-gateway-4.png)
