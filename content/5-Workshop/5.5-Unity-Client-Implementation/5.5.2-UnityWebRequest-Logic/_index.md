---
title : "API Request Logic"
date : "`r Sys.Date()`"
weight : 2
chapter : false
pre : " <b> 5.5.2 </b> "
---

Using `UnityWebRequest`, the game sends combat telemetry to the Backend. The system is strictly protected by a `try-catch` block to prevent JSON corruption from crashing the game.

### Code Implementation

```csharp
if (request.result == UnityWebRequest.Result.Success)
{
    string jsonResult = request.downloadHandler.text;
    
    // Catch the S3 link from the Header returned by Lambda
    string s3Url = request.GetResponseHeader("X-S3-Download-Url");
    if (!string.IsNullOrEmpty(s3Url))
    {
        Debug.Log($"[S3 OFFLINE LINK]: Saved static config at: {s3Url}");
    }

    // Try-Catch JSON Parsing
    AIBossResponse bossData = null;
    try
    {
        bossData = JsonUtility.FromJson<AIBossResponse>(jsonResult);
    }
    catch (System.Exception e)
    {
        Debug.LogError($"[AWS] JSON Parse error. Activating Local Fallback!\nDetails: {e.Message}");
    }

    if (bossData != null && bossData.Boss != null)
    {
        Debug.Log($"[AWS] SUCCESS! New Difficulty - Health: {bossData.Boss.Health}");
        ApplyNewBossStats(bossData.Boss);
    }
}
```

### Verification in Console

The Unity Console output proves that the system successfully received the configuration from AWS and successfully extracted the static S3 Download Link!

![Test](/images/aws_project/connect%20Unity%20with%20Lamda%20%20test.png)
![Console 1](/images/aws_project/unity_console_log.png)
![Console 2](/images/aws_project/unity_console_log-2.png)
