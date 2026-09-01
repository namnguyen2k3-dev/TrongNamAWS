---
title : "Backend Source Code"
date : "`r Sys.Date()`"
weight : 3
chapter : false
pre : " <b> 5.3.3 </b> "
---

The `Function.cs` file is the "brain" orchestrating API Gateway, Amazon Bedrock, DynamoDB, and Amazon S3. 

Notably, the latest version of this code extracts JSON directly from the `tool_use` block instead of parsing plain text, completely preventing data corruption for Unity:

```csharp
// 5. Extract JSON from tool_use block
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

// 6. Validate — if tool_use is missing, return 500
if (string.IsNullOrEmpty(aiGeneratedConfig))
{
    context.Logger.LogError("[Error] Bedrock didn't return a tool_use block...");
    return CreateResponse(500, "{\"error\":\"Bedrock did not return a valid tool_use block.\"}");
}
```

Furthermore, instead of returning the entire JSON payload to Unity (which wastes bandwidth), Lambda saves the JSON as a static file on Amazon S3 and "smuggles" the S3 Link via a secret HTTP Header:

```csharp
// Create a static URL for the file on S3
string s3Url = $"https://{BucketName}.s3.amazonaws.com/{fileName}";
context.Logger.LogInformation($"Successfully saved to S3 at: {s3Url}");

// Return wrappedConfig to Unity, attaching the S3 link to X-S3-Download-Url Header
return CreateResponse(200, wrappedConfig, s3Url);
```

> [!IMPORTANT]
> This is a classic Microservices architecture: Offloading network traffic. The Client downloads the static JSON file directly from S3, freeing up the API Gateway's processing thread!
