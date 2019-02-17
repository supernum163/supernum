---
title: "报表管理系统"
date: 2019-01-01T11:02:05+06:00
type: "post"
weight: 2
---

我们的报表管理系统默认是根据{{< hl-text red >}}__报表管理__{{< /hl-text >}}表来对报表进行管理的。您可以参考以下sql语句建立**\_\_报表管理\_\_**表，当然您需要修改部分内容以适应自己的数据库，比如SQLite中查询当前时间的方式是{{< hl-text blue >}}DATETIME('now', 'localtime'){{< /hl-text >}}，而SQL Server中则是{{< hl-text blue >}}GETDATE(){{< /hl-text >}}（以后不作赘述）。  

{{< codeblock "创建__报表管理__表" >}}
  CREATE TABLE IF NOT EXISTS __报表管理__ (
    制作者 VARCHAR(25),
    报表类别  VARCHAR(255),
    报表名称 VARCHAR(255) UNIQUE NOT NULL,
    报表位置 VARCHAR(255) NOT NULL,
    报表更新时间 DATETIME  DEFAULT (DATETIME('now', 'localtime')) NOT NULL,
    报表说明 TEXT
  );
{{< /codeblock >}}
<br>
在**\_\_报表管理\_\_**表中，您至少需要创建以下几个字段：**报表类别**、**报表名称**、**报表位置**，其它字段则可以根据实际需求创建或删除。

{{< image classes="clear fancybox fig-100" src="https://i.postimg.cc/FzrVbmS4/image.png" >}}
<br>
  
{{< hl-text green >}}报表类别{{< /hl-text >}}和{{< hl-text green >}}报表名称{{< /hl-text >}}是报表平台赖以生成报表导航栏的唯一依据，您必须保证报表被归纳到相应的类别、报表名称是唯一的，且名称不能太长(15个字以内)。  
  
{{< hl-text green >}}报表位置{{< /hl-text >}}是报表平台查找报表位置的唯一依据，您最好从数据库名开始，写出报表的完整路径。  

> 对于报表制作者而言，想要将您的报表上传至报表平台，您只需要在报表制作完成之后，将报表的信息插入**\_\_报表管理\_\_**表中即可。