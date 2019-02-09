---
title: "权限管理系统"
date: 2019-01-01T11:02:05+06:00
type: "post"
weight: 4
---

我们的用户管理系统默认是根据{{< hl-text red >}}__报表权限管理__{{< /hl-text >}}表来对用户阅读报表的权限进行管理的。您可以参考以下sql语句建立\_\_报表权限管理\_\_表。  

{{< codeblock "创建 __报表权限管理__ 表" >}}
CREATE TABLE IF NOT EXISTS __报表权限管理__ (
    报表名称 TEXT NOT NULL,
    授权者 TEXT,
    使用者 TEXT NOT NULL,
    字段筛选 TEXT DEFAULT "*" NOT NULL,
    记录筛选 TEXT DEFAULT NULL,
    权限说明 TEXT
);
{{< /codeblock >}}
<br>
在**\_\_报表权限管理\_\_**表中，您至少需要创建以下几个字段：**报表名称**、**使用者**、**字段筛选**，**记录筛选**，其它字段则可以根据实际需求创建或删除。  
  
{{< image classes="clear fancybox fig-100" src="/image/管理员手册/报表权限管理.png" >}}
<br>
{{< hl-text green >}}报表名称{{< /hl-text >}}即您在 [报表管理系统](/maintenance/reportmanager/) 中定义的报表名称，二者必须互相关联，否则将导致报表无法展示。  
   
{{< hl-text green >}}使用者{{< /hl-text >}}即您在 [用户管理系统](/maintenance/usermanager/) 中定义的用户名称，二者必须互相关联，否则将导致某些用户无法正常查看报表。  
   
{{< hl-text green >}}字段筛选{{< /hl-text >}}即允许用户查看那些字段。默认情况下为全部字段，您也可以指明用户所能查看的字段，使用逗号分割。    
   
{{< hl-text green >}}记录筛选{{< /hl-text >}}即允许用户查看那些记录。默认情况下为空，即允许用户查看全部记录，您可以使用静态SQL语句或验证用户身份的方式，限制用户所能访问的记录。比如：{{< hl-text blue >}}where rowid <= 10{{< /hl-text >}}，限制用户查询前10条记录，{{< hl-text blue >}}where 销售人员 = %用户名称%{{< /hl-text >}}， 限制用户只能访问该报表中{{< hl-text yellow >}}销售人员{{< /hl-text >}}的名字等于用户名称的记录。其中{{< hl-text blue >}}%{{< /hl-text >}}之间的信息将被逐一替换为用户的实际身份信息。    
  
**\_\_报表权限管理\_\_**表的每一条记录都可以解读为：授权给某个用户查看某个报表的那些行、那些列。为了便利权限分配，我们引入了共用账号的概念，将报表权限分配给共用账号将使所有用户都能查看该报表。权限也可以被覆盖，比如我们将{{< hl-text yellow >}}汽车销售详情表{{< /hl-text >}}赋权给共用账号（所有人）可以查看报表中{{< hl-text yellow >}}销售人员{{< /hl-text >}}的名字等于用户名称的记录，而在之前的记录中，我们又赋权{{< hl-text yellow >}}用户03{{< /hl-text >}}可以查看{{< hl-text yellow >}}汽车销售详情表{{< /hl-text >}}的全表。则{{< hl-text yellow >}}用户03{{< /hl-text >}}就可以查看全表，而其它用户只能查看报表中{{< hl-text yellow >}}销售人员{{< /hl-text >}}的名字等于用户名称的记录。  
  
> 本质上报表权限管理是对用户可以查看哪些报表内容进行管理，所以您只需要在有新报表上传，或有新用户注册的时候，给合适的用户查看合适的报表内容即可。

