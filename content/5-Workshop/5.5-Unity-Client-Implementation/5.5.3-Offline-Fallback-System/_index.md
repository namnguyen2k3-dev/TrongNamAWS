---
title : "Offline Fallback System"
date : "`r Sys.Date()`"
weight : 3
chapter : false
pre : " <b> 5.5.3 </b> "
---

This is the ultimate self-defense (Fallback System) of the project. When the connection to AWS fails (due to network loss or high latency), Unity immediately triggers the local Base AI.

However, when receiving parameters (whether from AWS or Local), the Boss does not apply them blindly. The game features an advanced `ApplyDDAStats` system with two mechanisms:

1. **Safety Clamp:** Regardless of what the AI returns, `Mathf.Clamp` prevents cooldowns from dropping to absurdly low levels (preventing the Boss from spamming skills infinitely). The timer is also forced to a safe threshold (`Mathf.Min(timer, 3f)`) instead of dropping to 0 immediately.
2. **Tracker Report:** A tracking system that compares old and new stats, printing a bold YELLOW report to the Console, clearly notifying the Designer if the Boss is "Cooling down" or going "Berserk".

### Code Implementation

```csharp
// ASSIGN FROM CONFIG BUT ALWAYS CLAMP WITHIN SAFE THRESHOLDS (Safety Net)
attackDamage = Mathf.Clamp(config.Attack, 40f, 300f);
summonCreepCD = Mathf.Clamp(config.SummonCreepCD, 4f, 20f);
lightningCD = Mathf.Clamp(config.LightningCD, 3f, 15f);
teleportCD = Mathf.Clamp(config.TeleportCD, 4f, 20f);

// FIX SKILL SPAM: NO MORE FORCING TO 0!
// Even if DDA is called 10 times in a row, the wait time is floored at 1.5s - 3s.
timerSummon = Mathf.Min(timerSummon, 3f);
timerLightning = Mathf.Min(timerLightning, 3f);
timerTeleport = Mathf.Min(timerTeleport, 3f);

// Log to Tracker
bool gotHarder = (summonCreepCD + lightningCD + teleportCD) < (oldSummonCD + oldLightningCD + oldTeleportCD);
string directionText = gotHarder
    ? "Boss is going Berserk! Cooldowns reduced, attacking aggressively!"
    : "Boss is cooling down! Cooldowns increased, giving the player breathing room.";

Debug.LogWarning(ddaReport); // Print DDA report to Console
```
