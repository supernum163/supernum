---
title: "用户留言管理系统"
date: 2019-01-01T11:02:05+06:00
type: "post"
weight: 8
---

我们的用户管理系统默认是根据{{< hl-text red >}}__留言管理__{{< /hl-text >}}表来对报表进行管理的。您可以参考以下sql语句建立**\_\_留言管理\_\_**表。  

{{< codeblock "创建__留言管理__表" >}}
CREATE TABLE IF NOT EXISTS __留言管理__ (
    留言者 TEXT NOT NULL,
    接收者 TEXT NOT NULL,
    留言时间 DATETIME DEFAULT (DATETIME('now', 'localtime')) NOT NULL,
    留言生效日期 DATE DEFAULT (DATE('now', 'localtime')),
    留言过期日期 DATE DEFAULT (DATE('now', 'localtime', '+90 day')),
    留言内容 TEXT NOT NULL
);
{{< /codeblock >}}
<br>
在**\_\_留言管理\_\_**表中，您至少需要创建以下几个字段：**留言者**、**接收者**、**留言时间**，**留言生效日期**，**留言过期日期**，**留言内容**，其它字段则可以根据实际需求创建或删除。  
  
{{< image classes="clear fancybox fig-100" src="https://i.postimg.cc/52TghZhB/image.png" >}}
<br>
{{< hl-text green >}}留言者{{< /hl-text >}}和{{< hl-text green >}}接收者{{< /hl-text >}}分别代表留言信息的发送者与接收者，两者都需要与 [用户管理系统](/maintenance/usermanager/) 中定义的用户名称相互关联。**留言者**与**接收者**可以是同一人，代表给自己留言（或添加备忘录）。  
  
{{< hl-text green >}}留言时间{{< /hl-text >}}即用户留下该留言信息的时间。  
  
{{< hl-text green >}}留言生效日期{{< /hl-text >}}和{{< hl-text green >}}留言过期日期{{< /hl-text >}}，定义了留言信息的有效期间，从**留言生效日期**开始，到**留言过期日期**结束，该留言信息会被一直推送给**接收者**。如果想要留一条永远不会过期的信息，只需要将这两个字段分别设为无限小和无限大的日期。  
  
{{< hl-text green >}}留言内容{{< /hl-text >}}即留言的信息，长度不能超过16个汉字。如果留言内容比较长，可以拆分成多条留言，报表平台会按照留言时间先后呈现留言信息。  
  
> **\_\_留言管理\_\_**表会根据用户的实际留言情况自动更新，理论上，您无需做任何维护工作。  

