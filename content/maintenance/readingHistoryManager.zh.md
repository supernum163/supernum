---
title: "阅读记录管理系统"
date: 2019-01-01T11:02:05+06:00
type: "post"
weight: 7
---

我们的用户管理系统默认是根据{{< hl-text red >}}__报表阅读记录__{{< /hl-text >}}表来对阅读记录进行管理的。您可以参考以下sql语句建立**\_\_报表阅读记录\_\_**表。  

{{< codeblock "创建__报表阅读记录__表" >}}
CREATE TABLE IF NOT EXISTS __报表阅读记录__ (
    报表名称 TEXT NOT NULL,
    阅读者 TEXT NOT NULL,
    最后一次阅读时间 DATETIME  DEFAULT (DATETIME('now', 'localtime')) NOT NULL,
    阅读次数 INT DEFAULT 1 NOT NULL
);
{{< /codeblock >}}
<br>
在**\_\_报表阅读记录\_\_**表中，您至少需要创建以下几个字段：**报表名称**、**阅读者**、**最后一次阅读时间**，**阅读次数**，其它字段则可以根据实际需求创建或删除。  
  
{{< image classes="clear fancybox fig-100" src="https://i.postimg.cc/MKrmBCKC/image.png" >}}
<br>
  
{{< hl-text green >}}报表名称{{< /hl-text >}}即您在 [报表管理系统](/maintenance/reportmanager/) 中定义的报表名称。  
   
{{< hl-text green >}}阅读者{{< /hl-text >}}即您在 [用户管理系统](/maintenance/usermanager/) 中定义的用户名称。  
   
{{< hl-text green >}}最后一次阅读时间{{< /hl-text >}}即用户最后一次阅读报表的时间。
   
{{< hl-text green >}}阅读次数{{< /hl-text >}}即用户阅读该报表的总次数。
  
同时您还需要在{{< hl-text red >}}__报表管理__{{< /hl-text >}}表中加入**报表更新时间**字段。  
  
{{< codeblock 创建__报表阅读记录__表 >}}
ALTER TABLE __报表管理__ 
    ADD COLUMN 报表更新时间 DATETIME  DEFAULT (DATETIME('now', 'localtime')) NOT NULL,
{{< /codeblock >}}
  
报表平台会根据{{< hl-text red >}}__报表阅读记录__{{< /hl-text >}}表中的{{< hl-text green >}}最后一次阅读时间{{< /hl-text >}}字段，和{{< hl-text red >}}__报表管理__{{< /hl-text >}}表中的{{< hl-text green >}}报表更新时间{{< /hl-text >}}字段，判断用户的阅读进度的。如果**最后一次阅读时间**大于**报表更新时间**则为{{< hl-text yellow >}}已读{{< /hl-text >}}，小于则为{{< hl-text yellow >}}有更新{{< /hl-text >}}，匹配不到**最后一次阅读时间**则为{{< hl-text yellow >}}未读{{< /hl-text >}}。  
  
> **__报表阅读记录__**表会根据用户的实际阅读情况自动插入数据，您无需做任何维护工作，只需要在每次更改报表的时候，在**\_\_报表管理\_\_**表中修改报表的**报表更新时间**即可。

