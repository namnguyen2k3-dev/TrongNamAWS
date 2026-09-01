---
title : "Proposal"
date : "`r Sys.Date()`"
weight : 3
chapter : false
pre : " <b> 3. </b> "
---

# Adaptive Boss AI & Serverless AI Backend on AWS

## Automated Game Configuration Generation Using Amazon Bedrock, AWS Lambda, and Unity

### 1. Executive Summary

This proposal presents a solution for building a **Serverless AI-driven Game Configuration System** on the AWS platform.

The project combines three main components:

* **Unity (AdaptiveBossAI)**: Serves as the Client and game configuration management interface. It triggers AI generation tasks and visualizes game configurations.
* **AWS Serverless (API Gateway & Lambda)**: Processes requests from Unity, executing the core logic written in C#.
* **AWS AI & Storage (Bedrock, DynamoDB, S3)**: Amazon Bedrock (Claude 4.5) generates Boss/NPC metrics. DynamoDB stores the generated configs persistently. S3 hosts the configuration files to provide a static download link back to the Unity client.

The architecture follows a modern **Serverless API → AI Generation → Storage** workflow.

The overall workflow is:
```text
Unity Request → API Gateway → Lambda → Amazon Bedrock (AI Generation) → Save to DynamoDB & S3 → Return S3 Link to Unity
```

---

### 2. Problem Statement

#### Current Problems

* **Manual Game Design**: Game designers and developers spend significant time manually balancing Boss attributes and NPC scripts.
* **Lack of Dynamic Content**: Updating game configurations requires pushing new client builds, slowing down liveops operations.
* **Scalability Bottlenecks**: Traditional monolithic backends struggle to scale during sudden spikes of player requests for new content.

#### Proposed Solution

The project builds a Serverless AI backend on AWS, in which:

1. **API Gateway** provides a secure endpoint for Unity to interact with the backend.
2. **AWS Lambda** executes the C# backend logic, orchestrating the AI generation process without managing servers.
3. **Amazon Bedrock** uses Claude 4.5 Haiku to intelligently generate game configurations and difficulty curves based on Unity data.
4. **Amazon DynamoDB** acts as a fast, scalable NoSQL database to store the generated AI configurations.
5. **Amazon S3** stores the JSON configurations as static files and provides a direct download link.
6. **Unity (AdaptiveBossAI)** fetches the S3 link and loads the new AI-generated configurations seamlessly.

#### Benefits

* Fully automates game balancing and content generation.
* Zero server maintenance thanks to the Serverless architecture.
* Decouples game configurations from client builds (LiveOps capability).
* High scalability with AWS Lambda and API Gateway.
* Centralized storage of AI outputs using DynamoDB and S3.

---

### 3. Solution Architecture

#### Overall Architecture Diagram

![AWS Architecture](/images/aws_project/aws_architecture.png)

#### Main Components

##### 1. Unity Client (AdaptiveBossAI)
The Unity engine acts as the front-end interface. It sends current game state data and requests new Boss/NPC configurations.

##### 2. API Gateway & AWS Lambda
API Gateway routes the HTTP request to the AWS Lambda function (`GameConfigProcessor`). Lambda processes the JSON payload and builds the prompt for the AI.

##### 3. Amazon Bedrock
AWS Lambda invokes Amazon Bedrock, utilizing the `anthropic.claude-4.5-haiku` model to generate a well-balanced JSON configuration for the game.

##### 4. Amazon DynamoDB
The generated configuration, along with metadata (ConfigID, Timestamp), is stored in the `GameConfigDB` table in DynamoDB for historical tracking and querying.

##### 5. Amazon S3
The final JSON configuration is uploaded to the `cloud-game-cms-2026` S3 bucket. S3 provides a highly available, static URL for Unity to download the file directly, reducing Lambda payload sizes.

---

### 4. Technical Implementation

#### Implementation Stages

1. **Storage Setup (Amazon S3)**
   * Create an S3 Bucket (`cloud-game-cms-2026`).
   * Configure Bucket Policies to allow public read access for Unity (if necessary) or secure presigned URLs.

2. **IAM Permissions**
   * Create IAM Roles and Policies for the Lambda execution role.
   * Grant Lambda permissions to access Amazon S3 (`s3:PutObject`), Amazon DynamoDB (`dynamodb:PutItem`), and Amazon Bedrock (`bedrock:InvokeModel`).

3. **Backend Logic (AWS Lambda)**
   * Write the C# function handler (`GameConfigProcessor`).
   * Package the application into a `.zip` file.
   * Deploy the source code to AWS Lambda and configure the handler entry point.

4. **AI Integration (Amazon Bedrock)**
   * Request model access for Claude 4.5 in Amazon Bedrock.
   * Integrate the Bedrock SDK into the C# Lambda project.

5. **Client Integration (Unity)**
   * Install the AWS SDK in Unity (if direct AWS access is needed) or use standard `UnityWebRequest` to call the API Gateway.
   * Parse the returned headers (`X-S3-Download-Url`) to download and apply the new game configuration.

---

### 5. Implementation Roadmap

```text
+------------------------------------------------------------+
| Stage 1: Storage & Database Setup                          |
| Amazon S3 (Bucket) & Amazon DynamoDB (Table)               |
+------------------------------------------------------------+
                         |
                         v
+------------------------------------------------------------+
| Stage 2: IAM & Security                                    |
| IAM Role → Policies for S3, DynamoDB, Bedrock              |
+------------------------------------------------------------+
                         |
                         v
+------------------------------------------------------------+
| Stage 3: Serverless Backend                                |
| C# Source Code → Build .zip → AWS Lambda Deployment        |
+------------------------------------------------------------+
                         |
                         v
+------------------------------------------------------------+
| Stage 4: AI Integration                                    |
| Lambda → Invoke Amazon Bedrock (Claude 4.5)                  |
+------------------------------------------------------------+
                         |
                         v
+------------------------------------------------------------+
| Stage 5: Unity Client Connection                           |
| UnityWebRequest → API Gateway → Receive S3 Link → Download |
+------------------------------------------------------------+
```

---

### 6. Budget Estimation

This project is deployed at a small scale for internship and experimentation purposes. Actual costs depend on the AWS Region, usage duration, number of requests, and storage volume.

| Component | Purpose | Cost Depends On |
|---|---|---|
| **Amazon S3** | Store game configuration JSON files | Storage volume + number of requests |
| **Amazon DynamoDB** | Store AI configuration metadata | Read/Write capacity units |
| **AWS Lambda** | Execute C# backend logic | Number of invocations + execution time |
| **Amazon API Gateway** | Provide REST API endpoint | Number of API calls |
| **Amazon Bedrock** | Generate game configs using Claude 4.5 | Number of input/output tokens |
| **IAM** | AWS access permission management | No separate charge |
| **CloudWatch** | Monitoring and logging | Metrics/logs |

Costs can be reduced by leveraging AWS Free Tier, limiting Bedrock invocations, and regularly monitoring the AWS Billing Dashboard.

---

### 7. Risk Assessment

| Risk | Severity | Mitigation Strategy |
|---|---|---|
| Bedrock returns invalid JSON | High | Design strict prompts, validate JSON responses before saving |
| Lambda timeout when calling Bedrock | Medium | Configure appropriate timeout (minimum 30s), implement retry logic |
| S3 Bucket unauthorized access | High | Configure Bucket Policy correctly, use presigned URLs if needed |
| IAM over-permissioned | High | Apply Least Privilege principle for Lambda execution role |
| Unexpected AWS costs | Medium | Monitor Billing, set Budget Alerts, limit Bedrock usage |
| API Gateway abuse (spam requests) | Medium | Set up throttling and usage plans on API Gateway |
| Unity client fails to receive S3 link | Medium | Implement error handling and retry in UnityWebRequest |
| DynamoDB write conflict | Low | Use unique ConfigID (GUID) for each generation |
| Bedrock model unavailable in Region | High | Check model availability before deployment, choose appropriate Region |

---

### 8. Expected Results

* Successfully build a Serverless AI backend for Unity games.
* Eliminate manual game configuration by leveraging Claude 4.5 via Amazon Bedrock.
* Seamlessly store configurations on S3 and DynamoDB.
* Establish a robust workflow: Unity → API Gateway → Lambda → Bedrock → S3 → Unity.
