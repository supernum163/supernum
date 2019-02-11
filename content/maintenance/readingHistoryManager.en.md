---
title: "Reading History Management"
date: 2019-01-01T11:02:05+06:00
type: "post"
weight: 7
---

By default, our user management system manages reading records according to the {{< hl-text red >}} __readingHistoryTable__ {{< /hl-text >}}. You can refer to the following SQL statement to create ** \_\_readingHistoryTable\_\_**.  

{{< codeblock "CREATE  __readingHistoryTable__" >}}
CREATE TABLE IF NOT EXISTS __readingHistoryTable__ (
  reportName TEXT NOT NULL,
  username TEXT NOT NULL,
  lastReadingTime DATETIME  DEFAULT (DATETIME('now', 'localtime')) NOT NULL,
  readingCount INT DEFAULT 1 NOT NULL
);
{{< /codeblock >}}
<br>
In ** \_\_readingHistoryTable\_\_**, you need to create at least the following columns: **reportName**, **username**, **lastReadingTime**, **readingCount**, other columns can be created or deleted according to actual needs.
  
{{< image classes="clear fancybox fig-100" src="/image/管理员手册/阅读记录管理.png" >}}
<br>
  
{{< hl-text green >}} rreportName {{< /hl-text >}} is the report name you defined in the [report management system] (/maintenance/ReportManagement/).  

{{< hl-text Green >}} username {{< /hl-text >}} is the user name you defined in the User Management System (/maintenance/UserManagement/).  

{{< hl-text green >}} lastReadingTime {{< /hl-text >}} is the last time the user reads the report.  

{{< hl-text green >}} readingCount {{< /hl-text >}} is the total number of times users read the report.  

At the same time, you need to add a **lastModifyTime** column to {{< hl-text red >}} __reportTable__ {{< /hl-text >}}.    
  
{{< codeblock "ALTER __reportTable__ ">}}
ALTER TABLE __reportTable__ 
    ADD COLUMN lastModifyTime DATETIME  DEFAULT (DATETIME('now', 'localtime')) NOT NULL,
{{< /codeblock >}}
  
User's reading progress will be defined according to the {{< hl-text green >}} lastModifyTime {{< /hl-text >}} column in {{< hl-text red >}} __reportTable__ {{< /hl-text >}} and the {{< hl-text green >}} lastReadingTime {{< /hl-text >}} column in {{< hl-text red >}} __readingHistoryTable__ {{< /hl-text >}}. If **lastReadingTime** is later than **lastModifyTime** then {{< hl-text yellow >}} read {{< /hl-text >}}, less than {{< hl-text yellow >}} updated {{< /hl-text >}}, and if **lastReadingTime** is NULL then  {{< hl-text yellow >}} unread {{< /hl-text >}}.  
  
> Data in **\_\_readingHistoryTable\_\_** will automatically updated according to users' actual reading situation. You just need to modify the **lastModifyTime** column of **\_\_ reportTable\_\_ ** when you create or modify a report.

