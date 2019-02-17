---
title: "Authentication Management"
date: 2019-01-01T11:02:05+06:00
type: "post"
weight: 4
---

By default, our Authentication management system manages the user's permission to read reports according to the {{< hl-text red >}} __authTable__ {{< /hl-text >}} table. You can refer to the following SQL statements to establish the **\_\_authTable\_\_** 

{{< codeblock "CREATE __authTable__ " >}}
CREATE TABLE IF NOT EXISTS __authTable__ (
  reportName TEXT NOT NULL,
  authGiver TEXT,
  reportUser TEXT NOT NULL,
  colSub TEXT DEFAULT "*" NOT NULL,
  rowSub TEXT DEFAULT NULL,
  authClaim TEXT
);
{{< /codeblock >}}
<br>
In the **\_\_authTable\_\_**, you need to create at least the following columns, **reportName**, **reportUser**, **colSub**, **rowSub**, other cloumns can be created or deleted according to your needs.    

{{< image classes="clear fancybox fig-100" src="https://i.postimg.cc/VNHwPLY7/auth-Table.png" >}}
<br>
{{< hl-text green >}} reportName {{< /hl-text >}} is the report name that you defined in the [__reportTable__] (/maintenance/report manager/). The two must be related to each other, otherwise the report will not be displayed.  

{{< hl-text green >}} reportUser {{< /hl-text >}} is the user name you defined in the [__userTable__] (/maintenance/usermanager/). They must be related to each other, otherwise some users will not be able to view the report properly.  

{{< hl-text green >}} colSub {{< /hl-text >}} columns which allow users to view. By default, all columns are allowed, you can also specify the columns that users can view, remenber to using commas to split them.  

{{< hl-text green >}} rowSub {{< /hl-text >}} records which allow users to view . By default, it is empty, which allows users to view all records. You can use static SQL statements or verify user identity to restrict the records that users can access. For example: {{< hl-text blue >}} where ROWID <= 10{{< /hl-text >}}, restrict users to query the first 10 records, {{< hl-text blue >}} where salesperson =% user name% {{< /hl-text >}}, restrict users to access only {{< hl-text yellow >}} salesperson {{< /hl-text >}} name in the report equal to user name record. Among them, the information between {{< hl-text blue >}}% {{< /hl-text >}} will be replaced by the user's actual identity information one by one.  

Each record in the **\_\_authTable\_\_** can be interpreted as the rows and columns authorized to a user to view a report.  

In order to facilitate permission allocation, we introduce the concept of {{< hl-text yellow >}} public account {{< /hl-text >}}. Allocating report permissions to public account will enable all users to view the report. Permissions can also be covered. For example, we empowered {{< hl-text yellow >}} CarSalesHistory {{< /hl-text >}} table to the public account to view the record that the name of {{< hl-text yellow >}} saler {{< /hl-text >}} in the report equals the user name. In the previous record, we empowered {{< hl-text yellow >}} user03{{< /hl-text >}} to view the full table of {{< hl-text yellow >}} CarSalesHistory {{< /hl-text >}} table. Then {{< hl-text yellow >}} user03{{< /hl-text >}} can view the full table, while other users can only view the record of {{< hl-text yellow >}} saler {{< /hl-text >}} name in the report. equal to user name  

> Essentially, report permission management is to manage which report content the user can view, so you only need to show the appropriate report content to the appropriate user when there is a new report upload, or when a new user registers.

