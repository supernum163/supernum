---
title: "可用报表"
date: 2019-01-01T11:02:05+06:00
type: "post"
weight: 5
---

报表平台默认展示的第一张报表，就是用户可以查看的报表列表。对于不同版本的产品，实现这个功能的方式略有不同。  
  
### 极速版  
  
对于极速版而言，您只需要创建一个{{< hl-text red >}}__可用报表__{{< /hl-text >}}视图，并将该视图的位置、名称、类别等信息作为第一条数据插入{{< hl-text red >}}__报表管理__{{< /hl-text >}}表即可。您可以参考以下sql语句建立**\_\_可用报表\_\_**视图。  
  
{{< codeblock "创建__可用报表__视图" >}}
CREATE VIEW IF NOT EXISTS __可用报表__ as 
SELECT
  制作者,
  报表类别, 
  报表名称, 
  报表更新时间,
  报表说明
FROM __报表管理__
{{< /codeblock >}}
<br>
{{< image classes="clear fancybox fig-100" src="/image/管理员手册/可视化管理01.png" >}}
  
  
### 会员版  
  
对于会员版而言，**\_\_可用报表\_\_**不仅是用户查看自己可以查看那些报表的地方，同时也是赖以统一 [报表管理系统](/maintenance/reportmanager/) 和 [权限管理系统](/maintenance/authmanager/) 的重要依据。您可以参考以下sql语句建立**\_\_可用报表\_\_**视图。  
  
{{< codeblock "创建__可用报表__视图" >}}
CREATE VIEW IF NOT EXISTS __可用报表__ AS
    SELECT 
           A.报表类别,
           A.报表名称,
           A.报表位置,
           B.字段筛选,
           B.记录筛选,
           A.报表更新时间,
           A.制作者,
           B.授权者,
           B.使用者,
           A.报表说明,
           B.权限说明
      FROM __报表管理__ AS A
      INNER JOIN __报表权限管理__ AS B 
      ON A.报表名称 = B.报表名称;
{{< /codeblock >}}
<br>
创建好**\_\_可用报表\_\_**视图之后，您需要将该视图的位置、名称、类别等信息作为第一条数据插入{{< hl-text red >}}\_\_报表管理\_\_{{< /hl-text >}}表，并在{{< hl-text red >}}\_\_报表权限管理\_\_{{< /hl-text >}}表中给共用账号分配适当的字段与记录查询条件。当然您也可以直接在**\_\_可用报表\_\_**中操作。最终可用报表的第一条记录应该如下图所示。  
  
{{< image classes="clear fancybox fig-100" src="/image/管理员手册/可视化管理02.png" >}}
  
  
### 高级定制版

对于高级定制版而言，我们会根据您定制的内容，帮助您建立合适的**\_\_可用报表\_\_**视图。  
<br>  

> **\_\_可用报表\_\_**是一个视图，一旦创建，就不要要对其作出任何修改。您只需要维护好 [报表管理系统](/maintenance/reportmanager/) 和 [权限管理系统](/maintenance/authmanager/)，其余的工作请交给视图和报表平台完成。
