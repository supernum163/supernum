---
Title: "DB Configurate"
Date: 2019-01-01T11 1:02:05+06:00
Type: "post"
Weight: 3
---
Configuring different types of database connections requires slightly different steps.  

For SQLite, you only need to provide the path of the database file of the SQLite. Of course, you can skip this configuration by using our default SQLLite database file.  

For MySQL, SQL Server, and other databases, you need to provide the user name and password necessary to connect to the database, as well as the database name to connect to. Of course, you can also not provide the library name, but we recommend that you create a new library dedicated to the report platform and put our system tables and all subsequent reports into it.  

For SQL Server, you also need to copy the following information, insert into {{< hl-text red >}}/etc/odbc.ini {{</hl-text >}} and modify {{< hl-text green>}} Server {{</hl-text >}} (server address), {{< hl-text green>}} Port {{</hl-text >}} (server port number), {{< hl-text green>}} User {{</hl-text>}}, {{<hl-text green >}} Password {{</hl-text >}} and {{<hl-text green >}} Database {{</hl-text >}} (database name to be connected) and other information.  

{{< codeblock "configure unixodbc" >}}
  [mssql]
  Description = connect to MicroSoft SQL Server
  Driver = FreeTDS
  TDS_Version = 8.0
  Trace=On
  TraceFile = stderr
  Server = 127.0.0.1
  Port=1433
  User = username
  Password = password
  Database = Master
{{</codeblock >}}  

### Test database connection  

Once the configuration is successful, you can test the database connection with the following code. Copy the code corresponding to your database, create a new R language script file named {{< hl-text yellow >}} dbConnTest.R {{</hl-text >}} and double-click open to paste the copied content on it, and save and exit. Open the terminal input command {{< hl-text blue >}} R-f dbConnTest.R {{</hl-text >}} and connect successfully if you can see the table name in your database after the command is executed.  

{{<alert warning >}} Alter the corresponding values of username, password and dbname in below.{{</alert >}}  

{{< tabbed-codeblock "test database connection" >}}
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