---
title: "User Management"
date: 2019-01-01T11:02:05+06:00
type: "post"
weight: 3
---

By default, our user management system manages users according to the {{< hl-text red >}}__userTable__{{< /hl-text >}}. You can refer to the following SQL statements to establish the **\_\_userTable\_\_**.  

{{< codeblock CREATE __userTable__  >}}
  CREATE TABLE IF NOT EXISTS __userTable__ (
    userName TEXT UNIQUE NOT NULL,
    department TEXT,
    password VARCHAR(40, 40) NOT NULL,
    registerTime DATETIME DEFAULT (DATETIME('now', 'localtime')) NOT NULL,
    lastActiveTime DATETIME DEFAULT (DATETIME('now', 'localtime')) NOT NULL,
    loginTryTime INT DEFAULT 0 NOT NULL,
    permission INT DEFAULT 0 NOT NULL
  );
{{< /codeblock >}}
<br>
In the **\_\userTable\_\_**, you need to create at least the following columns, **userName**, **password**, **registerTime**, **lastActiveTime**, **loginTryTime**, **permission**, other cloumns can be created or deleted according to your needs.  

{{< image classes="clear fancybox fig-100" src="/image/管理员手册/用户管理.png" >}}
<br>
{{< hl-text green >}} userName {{< /hl-text >}} is the name used by users when they login. This column must be unique, because this column is the only token we use to distinguish users.  
  
{{< hl-text green >}} password {{< /hl-text >}} is  the password used by users when they login. This column is stored in hash mode. Manual modification will cause users unable to login normally, and can only be modified through the {{< hl-text yellow >}} Modify {{</hl-text >}} entry of the report platform. If the user forgets his password and cannot change the password, You can delete his password, let the user login in with empty password, and then change the password. Or you can delete this user record to allow users to re-register.  
  
{{< hl-text green >}} registerTime {{< /hl-text >}} is the time when the user registers his account. You can quickly filter out new registered users by sorting this column.
  
{{< hl-text green >}} lastActiveTime {{< /hl-text >}} is the last time when the user successfully logged in. This column will be updated automatically, and it is also an important basis for the reporting platform to count users' attempts to login in the last day.。  
  
{{< hl-text green >}} loginTryTime {{< /hl-text >}} is the number of times a user failed in the last continuous login. If the number of login failures in a day exceeds {{< hl-text yellow >}} maxLoginTryTime {{</hl-text >}}, the account will be considered as an abnormal account, and be locked. The locked account will be automatically unlocked at users' first login on the next date, and if users login successfully, the loginTryTime will be automatically cleared.  
  
{{< hl-text green >}} permission {{< /hl-text >}} is whether users are allowed to login. The value of the newly registered user is 0. You need to manually change this value to 1 to allow the user to login normally. You can also change the value of a particular user to 0 to lock his account.  
  
**\_\userTable\_\_**Other columns can be created according to actual needs, and any columns you create can be used as user identity information to manage user privileges. For example, if we create a {{< hl-text green >}} department {{</hl-text >}} column to represent the user's department, then in the subsequent permission management system, we can restrict the user to access only the data of his department.  
  
> In fact, you don't need to maintain **\_\userTable\_\_** from time to time. You only need to update the identity information of new users after they register and grant them permission to login in **permission**. Other user-related items can be automatically completed by the reporting platform.   
