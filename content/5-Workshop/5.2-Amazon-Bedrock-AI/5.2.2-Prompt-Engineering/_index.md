---
title : "Prompt Engineering"
date : "`r Sys.Date()`"
weight : 2
chapter : false
pre : " <b> 5.2.2 </b> "
---

The latest update to the project's source code has upgraded the AI mechanism from "text guessing" to a strictly logical analysis system based on Claude 4.5's **Tool Use (Function Calling)** feature.

### 1. Analyzing Real-time Context (BossCurrentState)

Instead of just passing generic damage stats, our Prompt now passes the ACTUAL state of the Boss (`BossCurrentState`):

```csharp
string prompt = $@"You are an expert Game Designer for a 2D RPG.
Data sent from Unity consists of 2 parts, located in: {body}
- PlayerTelemetry: player behavior in the last phase (JumpCount, DashCount, DamageDealt, DamageTaken).
- BossCurrentState: ACTUAL current parameters of the Boss — BossType, AvailableSkills, TriggerMilestonePercent...
```

### 2. Core Balancing Rules (DDA)

The AI is forced to adhere to 6 highly detailed balancing rules:
- **Difficulty Signal:** If `DamageTaken` is high and `DamageDealt` is low (player is struggling) => Relax (increase cooldowns, reduce damage).
- **Playstyle Habits:** If `JumpCount` is high => AI recognizes the player jumps to dodge, automatically reduces Cooldown of anti-air skills (Lightning).
- **Consistency Preservation:** AI must ABSOLUTELY NOT invent skills that are not in `AvailableSkills`.

### 3. Forcing Data Types with Tool Use (JSON Schema)

To ensure the AI returns the exact JSON format that Unity can read (without extraneous text like "Hello, here is your JSON"), we define a JSON Schema named `generate_boss_config`.

```csharp
var toolDefinition = new JsonObject
{
    ["name"] = "generate_boss_config",
    ["description"] = "Generate new Boss balancing parameters based on player telemetry data",
    ["input_schema"] = new JsonObject
    {
        ["type"] = "object",
        ["properties"] = new JsonObject
        {
            ["Health"] = new JsonObject { ["type"] = "integer", ["minimum"] = 500, ["maximum"] = 20000 },
            ["TeleportCD"] = new JsonObject { ["type"] = "number", ["minimum"] = 4, ["maximum"] = 20 }
            // Setting Min/Max limits for CD to prevent the AI from forcing cooldowns to 0, causing skill spam
        }
    }
};
```

> [!TIP]
> Using **Tool Use** in combination with **Minimum/Maximum Limits** is an extremely sophisticated technique that protects the Client (Unity) from "silly" parameters caused by AI hallucination. The system will never crash when loading these configs!
