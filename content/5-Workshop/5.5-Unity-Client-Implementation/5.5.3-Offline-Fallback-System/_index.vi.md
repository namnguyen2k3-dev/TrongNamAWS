---
title : "Hệ thống Offline Fallback"
date : "`r Sys.Date()`"
weight : 3
chapter : false
pre : " <b> 5.5.3 </b> "
---

Đây là cơ chế tự vệ (Fallback System) đỉnh cao của dự án. Khi kết nối đến AWS thất bại (do rớt mạng hoặc độ trễ quá cao), Unity lập tức kích hoạt Base AI cục bộ. 

Nhưng khi nhận được thông số (dù từ AWS hay Local), Boss sẽ không áp dụng một cách mù quáng. Game sở hữu một hệ thống `ApplyDDAStats` siêu việt với 2 cơ chế:

1. **Safety Clamp (Chốt an toàn):** Bất kể AI trả về cái gì, `Mathf.Clamp` sẽ chặn không cho cooldown rớt xuống dưới mức phi lý (tránh lỗi Boss spam chiêu cháy máy). Thời gian chờ (timer) cũng được ép về một ngưỡng an toàn (`Mathf.Min(timer, 3f)`) thay vì đưa về 0 ngay lập tức.
2. **Tracker Report:** Một hệ thống theo dõi và đối chiếu chỉ số cũ/mới in đậm màu VÀNG ra Console, thông báo rõ ràng cho Designer biết Boss đang "Hạ nhiệt" hay "Nổi điên".

### Triển khai Code

```csharp
// GÁN TỪ CONFIG NHƯNG LUÔN KẸP TRONG NGƯỠNG AN TOÀN (Safety Net)
attackDamage = Mathf.Clamp(config.Attack, 40f, 300f);
summonCreepCD = Mathf.Clamp(config.SummonCreepCD, 4f, 20f);
lightningCD = Mathf.Clamp(config.LightningCD, 3f, 15f);
teleportCD = Mathf.Clamp(config.TeleportCD, 4f, 20f);

// SỬA LỖI SPAM CHIÊU: KHÔNG ÉP VỀ 0 NỮA!
// Dù DDA có bị gọi 10 lần liên tục, thời gian chờ cũng chỉ dừng ở 1.5s - 3s.
timerSummon = Mathf.Min(timerSummon, 3f);
timerLightning = Mathf.Min(timerLightning, 3f);
timerTeleport = Mathf.Min(timerTeleport, 3f);

// Log ra Tracker
bool gotHarder = (summonCreepCD + lightningCD + teleportCD) < (oldSummonCD + oldLightningCD + oldTeleportCD);
string directionText = gotHarder
    ? "Boss nổi điên! Giảm hồi chiêu, tấn công dồn dập hơn!"
    : "Boss hạ nhiệt! Tăng hồi chiêu, cho người chơi dễ thở hơn.";

Debug.LogWarning(ddaReport); // In ra Console báo cáo DDA
```
