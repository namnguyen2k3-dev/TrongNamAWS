---
title : "Mã nguồn Backend"
date : "`r Sys.Date()`"
weight : 3
chapter : false
pre : " <b> 5.3.3 </b> "
---

Đoạn mã C# `Function.cs` chịu trách nhiệm làm "đầu não" điều phối giữa API Gateway, Amazon Bedrock, DynamoDB và Amazon S3. 

Đặc biệt, phiên bản mới nhất của đoạn mã này xử lý việc trích xuất JSON trực tiếp từ `tool_use` thay vì bắt chuỗi Text thông thường, chống vỡ dữ liệu hoàn toàn cho Unity:

```csharp
// 5. Trích xuất JSON từ block tool_use (KHÔNG lấy từ text)
JsonDocument aiDoc = JsonDocument.Parse(bedrockResponseBody);
string aiGeneratedConfig = null;

foreach (var block in aiDoc.RootElement.GetProperty("content").EnumerateArray())
{
    if (block.GetProperty("type").GetString() == "tool_use")
    {
        aiGeneratedConfig = block.GetProperty("input").GetRawText();
        break;
    }
}

// 6. Validate — nếu không tìm được tool_use block thì trả 500
if (string.IsNullOrEmpty(aiGeneratedConfig))
{
    context.Logger.LogError("[Error] Bedrock không trả về tool_use block...");
    return CreateResponse(500, "{\"error\":\"Bedrock không trả về tool_use block hợp lệ.\"}");
}
```

Và thay vì trả toàn bộ payload JSON về cho Unity làm tốn băng thông, Lambda lưu JSON thành tệp tĩnh trên Amazon S3 và "tuồn" Link S3 đó qua một HTTP Header bí mật:

```csharp
// Tạo URL tĩnh của file trên S3
string s3Url = $"https://{BucketName}.s3.amazonaws.com/{fileName}";
context.Logger.LogInformation($"Đã lưu lên S3 thành công tại: {s3Url}");

// Trả wrappedConfig (có bọc Boss) cho Unity, kẹp thêm link S3 vào Header X-S3-Download-Url
return CreateResponse(200, wrappedConfig, s3Url);
```

> [!IMPORTANT]
> Đây là một kiến trúc Microservices điển hình: Chia nhỏ lưu lượng mạng. Client sẽ tự lấy file JSON tải tĩnh từ S3, không làm kẹt luồng xử lý của API Gateway!
