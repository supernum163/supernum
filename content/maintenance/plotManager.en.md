---
title: "Visualization Management"
date: 2019-01-01T11:02:05+06:00
type: "post"
weight: 6
---

{{< hl-text purple >}} Visualization Management {{< /hl-text >}} is present reports  visually, essentially, so you don't need to create additional system management tables, you just need to modify the existing system management tables slightly.。  

Firstly，you need to modify {{< hl-text red >}} __reportTable__ {{< /hl-text >}}， add a {{< hl-text green >}} plotCommand {{< /hl-text >}} cloumn.  
  
{{< codeblock "modify __reportTable__" >}}
ALTER TABLE __reportTable__ 
    ADD COLUMN plotCommand TEXT;
{{< /codeblock >}}
<br>
secondly，you need to modify {{< hl-text red >}}__authTable__{{< /hl-text >}}， add a {{< hl-text green >}} plotCommand {{< /hl-text >}} column.  
  
{{< codeblock "modify __authTable__" >}}
ALTER TABLE __authTable__ 
    ADD COLUMN plotCommand TEXT;
{{< /codeblock >}}
<br>
finally，you need to create an {{< hl-text red >}} __availableReports__  {{< /hl-text >}} view.  
  
{{< codeblock "__availableReports__" >}}
  CREATE VIEW IF NOT EXISTS __availableReports__ AS
    SELECT 
      A.reportType,
      A.reportName,
      A.reportPath,
      B.colSub,
      B.rowSub,
      A.lastModifyTime,
      A.reportMarker,
      B.authGiver,
      B.reportUser,
      A.reportClaim,
      B.authClaim,
      CASE WHEN B.plotCommand IS NOT NULL THEN B.plotCommand 
        WHEN A.plotCommand IS NOT NULL THEN A.plotCommand 
      ELSE NULL END AS plotCommand
    FROM __reportTable__ AS A
    INNER JOIN __authTable__ AS B 
    ON A.reportName = B.reportName;
{{< /codeblock >}}
<br>
{{< image classes="clear fancybox fig-100" src="/image/管理员手册/可视化管理03.png" >}}
<br>
So far our **Visualization Management** has been set up. When we need to visualize the report for users, we just need to insert the plot command into {{< hl-text green >}} plotCommand {{< /hl-text >}} of {{< hl-text red >}} __reportTable__ {{< /hl-text >}}. For example, if we set the drawing command of {{< hl-text yellow >}}CarSalesHistory {{< /hl-text >}} to {{< hl-text blue >}} ggplot(session$report) + geom_bar(aes(saler, price, fill = saler), stat = sum, positon = stack) {{< /hl-text >}}, then each user can see a bar chart showing saler's turnover, and each user can only see the situation of his department. (Controlled by privileges).  

**plotCommand** can be covered like permissions. For example, {{< hl-text yellow >}} user03 {{< /hl-text >}} can view all sales' record. So we can customize a visual report for him. We only need to add hte plot command for **user03** to Visualize **CarSalesHistory** into {{< hl-text green >}} plotCommand {{< /hl-text >}} of {{< hl-text red >}} __authTable__ {{< /hl-text >}}.  Then **user03** can view the overall status of salers and departments.
  
{{< alert info >}} Note that report currently viewed by users are stored in **session$report** in the report platform. {{< /alert >}}
  
> As for **Visualization Management**, you only need to consider presenting specific reports in a specific visual way, or viewing specific visual reports to specific users. These maintenance tasks can be one-time. 
  