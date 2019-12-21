---
title: "Report Management"
date: 2019-01-01T11:02:05+06:00
type: "post"
weight: 2
---

By default, our report management system manages reports according to {{< hl-text red >}} ___reportTable__ {{< /hl-text >}}. You can refer to the following SQL statements to establish the **\_\_reportTable\_\_**, of course, you need to modify some content to for your database, such as the way to query the current time in SQLite is {{< hl-text blue >}}DATETIME('now', 'localtime'){{< /hl-text >}}, in SQL Server is {{< hl-text blue >}}GETDATE(){{< /hl-text >}} .  

{{< codeblock "CREATE __reportTable__" >}}
  CREATE TABLE IF NOT EXISTS __reportTable__ (
    reportMarker TEXT,
    reportType  TEXT,
    reportName TEXT UNIQUE NOT NULL,
    reportPath TEXT NOT NULL,
    lastModifyTime DATETIME  DEFAULT (DATETIME('now', 'localtime')) NOT NULL,
    reportClaim TEXT,
    plotCommand TEXT
  );
{{< /codeblock >}}
<br>
In the **\_\_reportTable\_\_**，You need to create at least the following columns: **reportType**, **reportName**, **reportPath**, and other columns can be created or deleted according to actual needs.

{{< image classes="clear fancybox fig-100" src="/images/maintainance_reportTable.png" >}}
<br>
  
{{< hl-text green >}} reportType {{< /hl-text >}} and {{< hl-text green >}} reportName {{< /hl-text >}} are used to create the {{< hl-text purple >}}report filter{{< /hl-text >}}, you must ensure that the report is placed to the corresponding category, report name is unique, and the name can not be too long (less than 40 letters).  
  
{{< hl-text green >}} reportPath {{< /hl-text >}}is used to find the location of the report. You need to  write the complete path of the report.  

> For reports maintainer, to upload a report , you only need to insert the information of the report into the **\_\_reportTable\_\_**.  
