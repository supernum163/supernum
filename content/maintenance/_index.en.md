---
title: "maintenance"
date: 2019-01-01T11:02:05+06:00
icon: "fa-gears"
description: ""
type : "pages"
weight: 3
---

This manual is for the system administrator of the report platform. If you have not installed or configured our report platform successfully, please read [installation](/installation) first.  
  
As the administrator of our reporting platform, you don't have to read this manual word for word. Because you install different versions of reporting platforms, the systems that need to be maintained will also be different. This manual demonstrates the maintenance methods of different resource management systems in a modular way. You only need to look at the system related to your report platform to complete the daily maintenance work. The following table shows which resource management systems currently exist in each of the three versions :    
  
system                        | Primary Edition        | Membership Edition       | Custom Edition  
:---------------------------- | :----------------------| :------------------------| :-----------------  
Report Management             | Yes                    | Yes                      | Maybe  
User Management               | No                     | Yes                      | Maybe  
Authentication Management     | No                     | Yes                      | Maybe  
Visualization Management      | No                     | No                       | Maybe  
Reading History Management    | No                     | No                       | Maybe   
Message Management            | No                     | No                       | Maybe  
Available Reports             | Yes                   | Yes                       | Maybe
<br>

In addition, you do not have to follow the management manual method, one by one to establish the system table corresponding to the resource management system. When we help you configure the system, we will send you an SQL file to create the system table. You only need to refer to the SQL file to establish the system table.  

In fact, by default, our reporting platform connects to the SQLite database, and all the system tables have been configured in the SQLite database files. If you do not need to dock the report platform with other types of databases, you can directly maintain or modify our SQLite database files. 
