---
title: "Message Management"
date: 2019-01-01T11:02:05+06:00
type: "post"
weight: 8
---

By default, our user management system manages reports according to the {{< hl-text red >}} __messagesTable__ {{< /hl-text >}} table. You can refer to the following SQL statement to establish **\_\_ messagesTable\_\_** table.  

{{< codeblock "CREATE __messagesTable__" >}}
CREATE TABLE IF NOT EXISTS __messagesTable__ (
  sender TEXT NOT NULL,
  receiver TEXT NOT NULL,
  validTime DATETIME DEFAULT (DATETIME('now', 'localtime')) NOT NULL,
  expireTime DATETIME DEFAULT (DATETIME('now', 'localtime', '+90 day')),
  content TEXT NOT NULL
);
{{< /codeblock >}}
<br>
In the **\_\_ messagesTable\_\_** , you need to create at least the following cloumns: **sender**, **receiver**, **validTime**, **expireTime**, **content**, other cloumns can be created or deleted according to your needs.  
  
{{< image classes="clear fancybox fig-100" src="/image/管理员手册/留言管理.png" >}}
<br>
{{< hl-text green >}} sender {{< /hl-text >}} and {{< hl-text green >}} receiver {{< /hl-text >}} represent message sender and receiver respectively. Both of them need to be associated with userName defined in [user management system] (/maintenance/UserManagement/). **sender** and **receiver** can be the same person, representing users leave a message to themselves (or add a memorandum).  

{{< hl-text green >}}validTime {{< /hl-text >}} and {{< hl-text green >}} expireTime {{< /hl-text >}} define the validity period of message information. From **validTime** to **expireTime** end, the message will be pushed to **receiver** constantly. If you want to leave a message that will never expire, just set these two cloumns as infinitesimal and infinitesimal dates respectively.  

{{< hl-text green >}} content {{< /hl-text >}} is message information, the length can not exceed 25 letters. If the message content is relatively long, users need to be divide it into several messages, and the report platform will present the message information according to the time user leave the message.  

> **\_\_ messagesTable\_\_** will be updated automatically according to the actual situation of the user's message. In theory, you do not need to do any maintenance work.    
