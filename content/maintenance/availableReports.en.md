---
title: "Available Reports"
date: 2019-01-01T11:02:05+06:00
type: "post"
weight: 5
---

The first report that the report platform displays by default is a list of reports that users can view. For different versions of products, the way to achieve this function is slightly different.  
  
### Primary Edition  
  
For the Primary Edition, you just need to create a {{< hl-text red >}} __availableReports__ {{< /hl-text >}} view, and insert the location, name, category and other information of the view as the first data into the {{< hl-text red >}} __reportTable__ {{< /hl-text >}} table. You can refer to the following SQL statements to create the **\_\_availableReports\_\_** view.  
  
{{< codeblock "CREATE __availableReports__" >}}
  CREATE VIEW IF NOT EXISTS __availableReports__ as 
    SELECT
      reportMarker,
      reportType,
      reportName,
      reportPath,
      lastModifyTime,
      reportClaim,
    FROM __reportTable__
{{< /codeblock >}}
<br>
{{< image classes="clear fancybox fig-100" src="/images/maintainance_availableReports_01.png" >}}
  
  
### Membership Edition  
  
For Membership Edition, **\_\_availableReports\_\_** is not only the place where defines which reports users can view, but also the important basis for unification of [eport management system](/maintenance/ReportManagement/) and [Authentication management system](/maintenance/AuthenticationManagement/). You can refer to the following SQL statements to create the **\_\_availableReports\_\_** view.  

{{< codeblock "CREATE __availableReports__" >}}
  CREATE VIEW IF NOT EXISTS __availableReports__ as 
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
      B.authClaim
    FROM __reportTable__ AS A
    INNER JOIN __authTable__ AS B 
    ON A.reportName = B.reportName;
{{< /codeblock >}}
<br>
After creating the **\_\_availableReports\_\_** View, you need to insert the reportPath, reportName, reportType of the view as the first record into the {{< hl-text red >}} __reportTable__ {{< /hl-text >}} table, and assign appropriate columns and record query conditions to the public account in the {{< hl-text red >}} __authTable__ {{< /hl-text >}} table. Of course, you can also operate directly in **\_\_availableReports\_\_**. The first record of the available report should be shown in the following figure.  
  
{{< image classes="clear fancybox fig-100" src="/images/maintainance_availableReports_02.png" >}}
  
  
### Custom Edition  

For the Advanced Customization Edition, we will help you build the appropriate **\_\_availableReports\_\_** View based on your customized content.  
<br>  

> **\_\_availableReports\_\_** is a view, once created, do not make any changes to it. All you need to do is maintain the [eport management system](/maintenance/ReportManagement/) and the [Authentication management system](/maintenance/AuthenticationManagement/), and leave the rest to the view and supernum.

