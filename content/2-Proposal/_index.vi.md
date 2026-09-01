---
title : "Bản đề xuất"
date : "`r Sys.Date()`"
weight : 3
chapter : false
pre : " <b> 3. </b> "
---

# Adaptive Boss AI & Serverless AI Backend trên AWS

## Tự động hóa tạo cấu hình game sử dụng Amazon Bedrock, AWS Lambda và Unity

### 1. Tóm tắt điều hành

Đề xuất này trình bày giải pháp xây dựng hệ thống **Serverless Backend tích hợp AI** cho việc cấu hình game trên nền tảng AWS.

Project kết hợp ba thành phần chính:

- **Unity (AdaptiveBossAI)**: Đóng vai trò Client và giao diện quản lý cấu hình game. Gửi yêu cầu khởi tạo AI và trực quan hóa cấu hình game.
- **AWS Serverless (API Gateway & Lambda)**: Xử lý các yêu cầu từ Unity, thực thi logic cốt lõi bằng ngôn ngữ C#.
- **AWS AI & Storage (Bedrock, DynamoDB, S3)**: Amazon Bedrock (Claude 4.5) sinh ra chỉ số Boss/NPC. DynamoDB lưu trữ cấu hình sinh ra vĩnh viễn. S3 lưu trữ các tệp cấu hình để cung cấp đường dẫn tĩnh trả về cho Unity client.

Kiến trúc được xây dựng theo luồng làm việc **Serverless API → AI Generation → Storage**.

Quy trình tổng quát:
```text
Unity Request → API Gateway → Lambda → Amazon Bedrock (AI Generation) → Lưu vào DynamoDB & S3 → Trả về S3 Link cho Unity
```

---

### 2. Tuyên bố vấn đề

#### Vấn đề hiện tại

- **Thiết kế game thủ công**: Game designer và developer mất rất nhiều thời gian để cân bằng thủ công thuộc tính Boss và kịch bản NPC.
- **Thiếu nội dung động**: Cập nhật cấu hình game yêu cầu phải đẩy (push) các bản build client mới, làm chậm quá trình vận hành LiveOps.
- **Nghẽn cổ chai khi mở rộng**: Các backend nguyên khối (monolithic) truyền thống khó mở rộng khi lượng yêu cầu tải nội dung mới từ người chơi tăng đột biến.

#### Giải pháp đề xuất

Project xây dựng một Serverless AI backend trên AWS, trong đó:

1. **API Gateway** cung cấp endpoint bảo mật để Unity tương tác với backend.
2. **AWS Lambda** thực thi logic C#, điều phối quy trình sinh AI mà không cần quản lý máy chủ.
3. **Amazon Bedrock** sử dụng mô hình Claude 4.5 Haiku để sinh cấu hình game thông minh dựa trên dữ liệu từ Unity.
4. **Amazon DynamoDB** hoạt động như một cơ sở dữ liệu NoSQL tốc độ cao để lưu trữ cấu hình AI sinh ra.
5. **Amazon S3** lưu trữ file JSON cấu hình và cung cấp đường dẫn tải trực tiếp.
6. **Unity (AdaptiveBossAI)** tải file qua link S3 và nạp cấu hình mới một cách liền mạch.

#### Lợi ích

- Tự động hóa hoàn toàn việc cân bằng game và sinh nội dung.
- Không cần bảo trì máy chủ nhờ kiến trúc Serverless.
- Tách biệt cấu hình game khỏi bản build client (Hỗ trợ LiveOps).
- Khả năng mở rộng cao với AWS Lambda và API Gateway.
- Lưu trữ tập trung các kết quả AI bằng DynamoDB và S3.

---

### 3. Kiến trúc giải pháp

#### Sơ đồ kiến trúc tổng thể

![AWS Architecture](/images/aws_project/aws_architecture.png)

#### Các thành phần chính

##### 1. Unity Client (AdaptiveBossAI)
Unity đóng vai trò giao diện frontend. Nó gửi dữ liệu trạng thái game hiện tại và yêu cầu cấu hình Boss/NPC mới.

##### 2. API Gateway & AWS Lambda
API Gateway định tuyến yêu cầu HTTP đến AWS Lambda (`GameConfigProcessor`). Lambda xử lý JSON payload và tạo prompt gửi tới AI.

##### 3. Amazon Bedrock
AWS Lambda gọi Amazon Bedrock, sử dụng mô hình `anthropic.claude-4.5-haiku` để tạo ra file JSON cấu hình game cân bằng.

##### 4. Amazon DynamoDB
Cấu hình vừa tạo, kèm theo metadata (ConfigID, Timestamp), được lưu vào bảng `GameConfigDB` trong DynamoDB để theo dõi lịch sử và truy vấn.

##### 5. Amazon S3
File JSON cấu hình cuối cùng được upload lên S3 bucket `cloud-game-cms-2026`. S3 cung cấp URL tĩnh để Unity tải tệp trực tiếp, giúp giảm kích thước payload trả về của Lambda.

---

### 4. Triển khai kỹ thuật

#### Các giai đoạn triển khai

1. **Thiết lập lưu trữ (Amazon S3)**
   - Tạo S3 Bucket (`cloud-game-cms-2026`).
   - Cấu hình Bucket Policies để cấp quyền đọc công khai cho Unity hoặc tạo presigned URL.

2. **Quyền truy cập IAM**
   - Tạo IAM Roles và Policies cho Lambda execution role.
   - Cấp quyền cho Lambda truy cập S3 (`s3:PutObject`), DynamoDB (`dynamodb:PutItem`), và Bedrock (`bedrock:InvokeModel`).

3. **Backend Logic (AWS Lambda)**
   - Viết function handler bằng C# (`GameConfigProcessor`).
   - Đóng gói ứng dụng thành file `.zip`.
   - Triển khai source code lên AWS Lambda và cấu hình handler entry point.

4. **Tích hợp AI (Amazon Bedrock)**
   - Yêu cầu cấp quyền truy cập model Claude 4.5 trong Amazon Bedrock.
   - Tích hợp Bedrock SDK vào project C# Lambda.

5. **Tích hợp Client (Unity)**
   - Cài đặt thư viện AWS SDK vào Unity hoặc sử dụng `UnityWebRequest` tiêu chuẩn gọi API Gateway.
   - Đọc headers trả về (`X-S3-Download-Url`) để tải và áp dụng cấu hình game mới.

---

### 5. Lộ trình & Mốc triển khai

```text
+------------------------------------------------------------+
| Giai đoạn 1: Storage & Database Setup                      |
| Thiết lập Amazon S3 (Bucket) & Amazon DynamoDB (Table)     |
+------------------------------------------------------------+
                         |
                         v
+------------------------------------------------------------+
| Giai đoạn 2: IAM & Security                                |
| Cấu hình IAM Role → Policies cho S3, DynamoDB, Bedrock     |
+------------------------------------------------------------+
                         |
                         v
+------------------------------------------------------------+
| Giai đoạn 3: Serverless Backend                            |
| Code C# → Build .zip → Triển khai AWS Lambda               |
+------------------------------------------------------------+
                         |
                         v
+------------------------------------------------------------+
| Giai đoạn 4: AI Integration                                |
| Gọi Amazon Bedrock (Claude 4.5) từ Lambda                    |
+------------------------------------------------------------+
                         |
                         v
+------------------------------------------------------------+
| Giai đoạn 5: Unity Client Connection                       |
| UnityWebRequest → API Gateway → Nhận S3 Link → Download    |
+------------------------------------------------------------+
```

---

### 6. Ước tính ngân sách

Project được triển khai ở quy mô nhỏ phục vụ mục đích thực tập và thử nghiệm. Chi phí thực tế phụ thuộc vào Region, thời gian sử dụng, số lượng request và dung lượng lưu trữ.

| Thành phần | Mục đích | Chi phí phụ thuộc |
|---|---|---|
| **Amazon S3** | Lưu trữ file JSON cấu hình game | Dung lượng + số lượng request |
| **Amazon DynamoDB** | Lưu trữ metadata cấu hình AI | Read/Write capacity units |
| **AWS Lambda** | Xử lý logic backend C# | Số lượng invocations + thời gian thực thi |
| **Amazon API Gateway** | Cung cấp REST API endpoint | Số lượng API calls |
| **Amazon Bedrock** | Sinh cấu hình game bằng Claude 4.5 | Số lượng input/output tokens |
| **IAM** | Phân quyền truy cập AWS | Không tính phí riêng |
| **CloudWatch** | Monitoring và logging | Metrics/logs |

Có thể giảm chi phí bằng cách tận dụng AWS Free Tier, giới hạn số lần gọi Bedrock, và thường xuyên theo dõi AWS Billing Dashboard.

---

### 7. Đánh giá rủi ro

| Rủi ro | Mức độ | Chiến lược giảm thiểu |
|---|---|---|
| Bedrock trả về JSON không hợp lệ | Cao | Thiết kế prompt chặt chẽ, validate JSON response trước khi lưu |
| Lambda timeout khi gọi Bedrock | Trung bình | Cấu hình timeout phù hợp (tối thiểu 30s), retry logic |
| S3 Bucket bị truy cập trái phép | Cao | Cấu hình Bucket Policy chính xác, sử dụng presigned URL nếu cần |
| IAM cấp quyền quá mức | Cao | Áp dụng nguyên tắc Least Privilege cho Lambda execution role |
| Chi phí AWS ngoài dự kiến | Trung bình | Theo dõi Billing, đặt Budget Alerts, giới hạn Bedrock usage |
| API Gateway bị lạm dụng (spam request) | Trung bình | Thiết lập throttling và usage plan trên API Gateway |
| Unity client không nhận được S3 link | Trung bình | Xử lý error handling và retry trong UnityWebRequest |
| DynamoDB write conflict | Thấp | Sử dụng ConfigID unique (GUID) cho mỗi lần sinh cấu hình |
| Bedrock model không khả dụng tại Region | Cao | Kiểm tra model availability trước khi triển khai, chọn Region phù hợp |

---

### 8. Kết quả kỳ vọng

- Xây dựng thành công Serverless AI backend cho Unity game.
- Loại bỏ công việc cấu hình game thủ công nhờ sử dụng Claude 4.5 qua Amazon Bedrock.
- Lưu trữ cấu hình liền mạch trên S3 và DynamoDB.
- Thiết lập quy trình vận hành mạnh mẽ: Unity → API Gateway → Lambda → Bedrock → S3 → Unity.
