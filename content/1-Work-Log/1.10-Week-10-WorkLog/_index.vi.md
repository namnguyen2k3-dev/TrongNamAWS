---
title : "WorkLog Tuần 10"
date : "`r Sys.Date()`"
weight : 10
chapter : false
pre : " <b> 1.10 </b> "
---

### Mục tiêu tuần 10:  
  
  - Thiết kế hệ thống Fallback System phòng trường hợp mất mạng hoặc độ trễ cao.  
  - Lập trình hàm `ApplyDDAStats` xử lý chuyển giao giữa AWS AI và Local Base AI.  
  - Cân bằng các chỉ số trần (Max/Min Caps) để bảo đảm trải nghiệm game ổn định.  
  
### Các công việc cần triển khai trong tuần này:  
  
  | Thứ | Công việc                                                                   | Ngày bắt đầu | Ngày hoàn thành | Nguồn tài liệu                        |
|-----:|-----------------------------------------------------------------------------|--------------|-----------------|---------------------------------------|
| 2    | Thiết kế kiến trúc Offline Fallback System cho game                         | 14/09/2026   | 14/09/2026      |                                       |
| 3    | Lập trình hàm ApplyDDAStats: xử lý chuyển đổi Online (AWS) / Offline       | 15/09/2026   | 16/09/2026      |                                       |
| 4    | Cân bằng chỉ số Max/Min Caps cho Boss (ATK, DEF, MoveSpeed, Cooldown)      | 16/09/2026   | 17/09/2026      |                                       |
| 5    | Test chuyển đổi giữa chế độ AWS AI và Local Base AI                        | 17/09/2026   | 18/09/2026      |                                       |
| 6    | Tìm hiểu thêm về Security best practices: API key, IAM least privilege    | 18/09/2026   | 19/09/2026      | https://cloudjourney.awsstudygroup.com/ |
  
### Kết quả đạt được tuần 10:  
  
  - Hoàn thành Fallback System cho phép game hoạt động ổn định khi mất kết nối AWS.  
  - Hàm `ApplyDDAStats` chuyển đổi mượt mà giữa Online và Offline mode.  
  - Các chỉ số Boss được giới hạn hợp lý, đảm bảo trải nghiệm game cân bằng.
