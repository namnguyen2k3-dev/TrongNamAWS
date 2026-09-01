---
title : "WorkLog Tuần 7"
date : "`r Sys.Date()`"
weight : 7
chapter : false
pre : " <b> 1.7 </b> "
---

### Mục tiêu tuần 7:  
  
  - Viết mã nguồn C# cho hàm Lambda (`Function.cs`) làm "đầu não" điều phối.  
  - Tích hợp SDK `Amazon.BedrockRuntime` để gọi API sang Claude 4.5 Haiku.  
  - Xây dựng logic trích xuất JSON từ khối `tool_use` và lưu vào DynamoDB/S3.  
  
### Các công việc cần triển khai trong tuần này:  
  
  | Thứ | Công việc                                                                 | Ngày bắt đầu | Ngày hoàn thành | Nguồn tài liệu                        |
|-----:|---------------------------------------------------------------------------|--------------|-----------------|---------------------------------------|
| 2    | Viết System Prompt cho Claude phân tích Player Telemetry (HP, DPS, Dodge) | 24/08/2026   | 24/08/2026      | https://docs.anthropic.com/            |
| 3    | Định nghĩa Tool Use schema JSON cho BossConfig (ATK, DEF, MoveSpeed, CD) | 25/08/2026   | 25/08/2026      | https://docs.aws.amazon.com/bedrock/   |
| 4    | Viết mã `Function.cs`: tích hợp API Gateway → Bedrock → S3               | 26/08/2026   | 27/08/2026      | https://docs.aws.amazon.com/lambda/    |
| 5    | Cài đặt SDK `Amazon.BedrockRuntime`, xử lý trích xuất tool_use block     | 27/08/2026   | 28/08/2026      | https://docs.aws.amazon.com/bedrock/   |
| 6    | Viết logic lưu cấu hình AI vào DynamoDB Table và upload JSON lên S3      | 28/08/2026   | 29/08/2026      | https://docs.aws.amazon.com/dynamodb/  |
  
### Kết quả đạt được tuần 7:  
  
  - Hoàn thành bộ mã nguồn C# `Function.cs` xử lý luồng API Gateway → Bedrock → S3.  
  - Tích hợp thành công SDK BedrockRuntime để gọi Claude 4.5 Haiku qua Tool Use.  
  - Xây dựng logic trích xuất JSON chính xác từ `tool_use` block, tránh lỗi parse dữ liệu.
