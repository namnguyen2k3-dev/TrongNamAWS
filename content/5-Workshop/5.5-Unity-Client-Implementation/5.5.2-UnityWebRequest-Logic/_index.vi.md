---
title : "Logic gửi API"
date : "`r Sys.Date()`"
weight : 2
chapter : false
pre : " <b> 5.5.2 </b> "
---

Bằng cách sử dụng `UnityWebRequest`, trò chơi gửi thông số chiến đấu về Backend. Hệ thống được bảo vệ cực kỳ nghiêm ngặt bằng khối `try-catch` để phòng hờ trường hợp dữ liệu JSON bị hỏng, tránh làm Crash game.

### Triển khai Code

```csharp
if (request.result == UnityWebRequest.Result.Success)
{
    string jsonResult = request.downloadHandler.text;
    
    // Bắt link S3 từ Header trả về của Lambda
    string s3Url = request.GetResponseHeader("X-S3-Download-Url");
    if (!string.IsNullOrEmpty(s3Url))
    {
        Debug.Log($"[S3 OFFLINE LINK]: Đã lưu file cấu hình tĩnh tại: {s3Url}");
    }

    // Parse JSON có bảo vệ Try-Catch
    AIBossResponse bossData = null;
    try
    {
        bossData = JsonUtility.FromJson<AIBossResponse>(jsonResult);
    }
    catch (System.Exception e)
    {
        Debug.LogError($"[AWS] Parse JSON lỗi. Kích hoạt Fallback Local!\nDetails: {e.Message}");
    }

    if (bossData != null && bossData.Boss != null)
    {
        Debug.Log($"[AWS] THÀNH CÔNG! Độ khó mới - Máu: {bossData.Boss.Health}");
        ApplyNewBossStats(bossData.Boss);
    }
}
```

### Kiểm chứng tại Console

Kết quả trong Console của Unity chứng minh rằng hệ thống đã nhận được cấu hình từ AWS và bóc tách thành công Link Download tĩnh từ S3!

![Test](/images/aws_project/connect%20Unity%20with%20Lamda%20%20test.png)
![Console 1](/images/aws_project/unity_console_log.png)
![Console 2](/images/aws_project/unity_console_log-2.png)
