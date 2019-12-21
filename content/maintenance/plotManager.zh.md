---
title: "可视化管理系统"
date: 2019-01-01T11:02:05+06:00
type: "post"
weight: 6
---

{{< hl-text purple >}}可视化管理系统{{< /hl-text >}}本质上是将报表以可视化的形式呈现出来，所以您不需要创建额外的系统管理表，只需要在已有的系统管理表中稍加修改。  

首先，修改{{< hl-text red >}}__报表管理__{{< /hl-text >}}表， 加入{{< hl-text green >}}绘图命令{{< /hl-text >}}字段：  
  
{{< codeblock "修改__报表管理__表" >}}
ALTER TABLE __报表管理__ 
    ADD COLUMN 绘图命令 TEXT;
{{< /codeblock >}}
<br>
其次，修改{{< hl-text red >}}__报表权限管理__{{< /hl-text >}}表， 加入{{< hl-text green >}}定制绘图命令{{< /hl-text >}}字段：  
  
{{< codeblock "修改__报表权限管理__表" >}}
ALTER TABLE __报表权限管理__ 
    ADD COLUMN 定制绘图命令 TEXT;
{{< /codeblock >}}
<br>
最后，创建{{< hl-text red >}}__可用报表__ {{< /hl-text >}}视图
  
{{< codeblock "创建__可用报表__ 视图" >}}
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
           B.权限说明,
           CASE WHEN B.定制绘图命令 IS NOT NULL THEN B.定制绘图命令 
                WHEN A.绘图命令 IS NOT NULL THEN A.绘图命令 
           ELSE "" END AS 绘图命令
      FROM __报表管理__ AS A
      INNER JOIN __报表权限管理__ AS B 
      ON A.报表名称 = B.报表名称;
{{< /codeblock >}}

<br>

{{< image group="visual" classes="fancybox fig-50" src="/images/管理员手册_可视化管理_01.png" >}}
{{< image group="visual" classes="fancybox fig-50" src="/images/管理员手册_可视化管理_02.png" >}}
{{< image group="visual" classes="clear fancybox fig-100" src="/images/管理员手册_可视化管理_03.png" >}}

<br>

至此我们的**可视化管理系统**就已经搭建成功了。当我们需要将报表以可视化的形式展现给阅读着时，我们只需要将生成可视化图表的命令插入{{< hl-text red >}}__报表管理__{{< /hl-text >}}表中的{{< hl-text green >}}绘图命令{{< /hl-text >}}中即可。比如我们将{{< hl-text yellow >}}汽车销售详情表{{< /hl-text >}}的绘图命令设为{{< hl-text blue >}}ggplot(s$report) + geom_bar(aes(销售人员, 价格, fill = 销售人员), stat = "sum", positon = "stack")  {{< /hl-text >}}，则每个用户都能看到一幅显示销售人员营业额的柱形图，而且每个用户都只能看到自己部门销售人员的情况（受权限控制）。  
  
绘图命令也拥有像权限一样可覆盖的功能，比如{{< hl-text yellow >}}用户03{{< /hl-text >}}可以查看所有人的销售情况，我们就可以专门为他定制一份可视化报表，只需要{{< hl-text red >}}__报表权限管理__{{< /hl-text >}}表的{{< hl-text green >}}定制绘图命令{{< /hl-text >}}中，将绘图命令加入到给**用户03**分配**汽车销售详情表**权限的记录中，**用户03**就能查看到分析全体销售人员、销售部门的综合型图表。  
  
{{< alert info >}} 注意用户当前查看的报表在报表平台中是在**s$report**中存储的。 {{< /alert >}}
  
> 对于**可视化管理系统**，您只需要考虑将特定的报表以特定的可视化方式呈现出来，或者给特定的用户查看特定的可视化报表。而这些维护工作都可以是一次性的。  
  