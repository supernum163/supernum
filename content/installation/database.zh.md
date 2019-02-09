---
title: "配置数据库"
date: 2019-01-01T11:02:05+06:00
type: "post"
weight: 3
---

配置不同类型的数据库连接，需要的步骤略有不同。  
  
对于SQLite数据库，您只需要提供SQLite的数据库文件所在路径即可。当然您完全可以使用我们默认的SQLite的数据库文件，跳过这篇配置。  
  
对于MySQL、SQL Server等数据库，您需要提供连接数据库所必须的用户名和密码，以及需要连接的数据库库名。当然您也可以不提供库名、但我们建议您新建一个专用于报表平台的库，将我们的系统表和后续所有的报表都放入其中。  
  
对于SQL Server数据库，您还需要复制以下信息，插入{{< hl-text red >}}/etc/odbc.ini {{< /hl-text >}}，并根据您数据库的实际信息，修改其中的{{< hl-text green >}}Server{{< /hl-text >}}（服务器地址）、{{< hl-text green >}}Port{{< /hl-text >}}（服务器端口号）、{{< hl-text green >}}User{{< /hl-text >}}（用户名）、{{< hl-text green >}}Password{{< /hl-text >}}（密码）及{{< hl-text green >}}Database{{< /hl-text >}} (需要连接的数据库库名)等信息。 

{{< codeblock "配置unixodbc">}}
[mssql]
Description=connect to MicroSoft SQL Server
Driver=FreeTDS
TDS_Version=8.0
Trace=On
TraceFile=stderr
Server=127.0.0.1 
Port=1433 
User=username 
Password=password 
Database=master 
{{< /codeblock >}}

### 测试数据库连接  

配置万成功后您可以通过以下代码测试数据库连接。将与您的数据库对应的代码复制下来，新建一个R语言脚本文件并命名为{{< hl-text yellow >}}dbConnTest.R{{< /hl-text >}}，双击打开将复制的内容粘贴上去，并保存退出。打开终端输入命令{{< hl-text blue >}}R -f dbConnTest.R{{< /hl-text >}},命令执行后如果能看到您数据库中的表名被显示出来即连接成功。  
  
{{< alert warning >}} 注意修改代码中username、password和dbname对应的值 {{< /alert >}}

{{< tabbed-codeblock "测试数据库连接" >}}
  <!-- tab SQLite -->
    library(DBI)
    conn <- dbConnect(RSQLite::SQLite(), dbname = 'supernumV3.1.1.db')
    dbListTables(conn)
    dbDisconnect(conn)
  <!-- endtab -->
  <!-- tab MySQL -->
    library(DBI)
    conn <- dbConnect(RMySQL::MySQL(), username = "username", password = "password", dbname = "mysql")
    dbListTables(conn)
    dbDisconnect(conn)
  <!-- endtab -->
  <!-- tab SQLServer -->
    library(DBI)
    conn <- dbConnect(odbc::odbc(), 'mssql', uid = 'username', pwd = 'password', database = "master")
    dbListTables(conn)
    dbDisconnect(conn)
  <!-- endtab -->
{{< /tabbed-codeblock >}}

