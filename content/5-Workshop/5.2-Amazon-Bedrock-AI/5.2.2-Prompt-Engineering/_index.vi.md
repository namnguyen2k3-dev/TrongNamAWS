---
title : "Kỹ nghệ Prompt"
date : "`r Sys.Date()`"
weight : 2
chapter : false
pre : " <b> 5.2.2 </b> "
---

Bản cập nhật mã nguồn mới nhất của dự án đã nâng cấp cơ chế AI từ việc "đoán mò văn bản" sang một hệ thống phân tích logic cực kỳ chặt chẽ dựa trên tính năng **Tool Use (Function Calling)** của Claude 4.5.

### 1. Phân tích ngữ cảnh thực tế (BossCurrentState)

Thay vì chỉ truyền thông số sát thương chung chung, Prompt của chúng ta nay truyền cả trạng thái THỰC TẾ của Boss (`BossCurrentState`):

```csharp
string prompt = $@"Bạn là một chuyên gia Game Designer cho dòng game 2D RPG.
Dữ liệu gửi lên từ Unity gồm 2 phần, nằm trong: {body}
- PlayerTelemetry: hành vi người chơi trong phase vừa qua (JumpCount, DashCount, DamageDealt, DamageTaken).
- BossCurrentState: thông số THỰC TẾ hiện tại của Boss — BossType, AvailableSkills, TriggerMilestonePercent...
```

### 2. Các Quy Tắc Cân Bằng Cốt Lõi (DDA)

AI bị ép tuân thủ 6 nguyên tắc cân bằng cực kỳ chi tiết:
- **Tín hiệu Độ khó:** Nếu `DamageTaken` cao và `DamageDealt` thấp (người chơi đang yếu) => Nới lỏng (tăng cooldown, giảm sát thương).
- **Thói quen chơi:** Nếu `JumpCount` cao => AI nhận diện người chơi hay nhảy né, AI tự động giảm Cooldown của chiêu bắt trên không (Lightning). Nếu `DashCount` cao => AI giảm Cooldown của chiêu tạo khoảng cách (Teleport).
- **Bảo toàn tính nhất quán:** AI tuyệt đối KHÔNG ĐƯỢC bịa thêm chiêu thức không có trong `AvailableSkills`.

### 3. Ép kiểu dữ liệu bằng Tool Use (JSON Schema)

Để AI trả về chính xác JSON mà Unity có thể đọc được (không kèm văn bản thừa như "Chào bạn, đây là file JSON"), chúng ta định nghĩa một JSON Schema có tên `generate_boss_config`.

```csharp
var toolDefinition = new JsonObject
{
    ["name"] = "generate_boss_config",
    ["description"] = "Sinh thông số cân bằng Boss mới dựa trên dữ liệu telemetry của người chơi",
    ["input_schema"] = new JsonObject
    {
        ["type"] = "object",
        ["properties"] = new JsonObject
        {
            ["Health"] = new JsonObject { ["type"] = "integer", ["minimum"] = 500, ["maximum"] = 20000 },
            ["TeleportCD"] = new JsonObject { ["type"] = "number", ["minimum"] = 4, ["maximum"] = 20 }
            // Cài đặt ngưỡng Min/Max cho CD để chặn lỗi AI ép cooldown về 0 gây Spam chiêu
        }
    }
};
```

> [!TIP]
> Việc sử dụng **Tool Use** kết hợp với **Minimum/Maximum Limits** là một kỹ thuật cực kỳ tinh vi giúp bảo vệ Client (Unity) khỏi những thông số "ngớ ngẩn" do AI hallucination sinh ra. Hệ thống sẽ không bao giờ văng lỗi khi tải các cấu hình này!
