---
title : "Triển khai & Cấu hình"
date : "`r Sys.Date()`"
weight : 4
chapter : false
pre : " <b> 5.3.4 </b> "
---

Sau khi viết code xong, ta cần đóng gói và đẩy lên AWS, đồng thời chỉnh sửa thông số Timeout cho phù hợp.

### Các bước thực hiện

1. Tại máy tính (Visual Studio / Rider), Build project .NET và nén toàn bộ thư mục Release thành một tệp `.zip`.

   ![Tạo zip 1](/images/aws_project/t%E1%BA%A1o%20.zip.png)
   ![Tạo zip 2](/images/aws_project/%C4%91%C3%B3ng%20g%C3%B3i%20.zip-test.png)
   ![Tạo zip 3](/images/aws_project/%C4%91%C3%B3ng%20g%C3%B3i%20zip%202%20.png)
2. Tại AWS Lambda Console, cuộn xuống phần **Code**.
3. Nhấn **Upload from** -> **.zip file** và tải file `.zip` của bạn lên.

   ![Upload Code](/images/aws_project/update_src_code%20.zip.png)
   ![Update Complete](/images/aws_project/Update_complete.png)

4. Cuộn xuống phần **Runtime settings**, nhấn **Edit**. Sửa **Handler** thành đường dẫn Namespace và tên class của bạn (VD: `GameConfigProcessor::GameConfigProcessor.Function::FunctionHandler`).

   ![Handler](/images/aws_project/handler.png)

5. Chuyển sang tab **Configuration**, chọn **General configuration**.
6. Nhấn **Edit** và tăng tham số **Timeout** từ 3 giây (mặc định) lên **30 giây**. 
   *Vì sao?* Quá trình gọi AI Bedrock và khởi động lạnh (Cold Start) của .NET thường mất vài giây. Nếu để 3 giây, hàm Lambda sẽ bị "giết" trước khi kịp sinh xong dữ liệu!

   ![Timeout](/images/aws_project/lambda_timeout.png)
