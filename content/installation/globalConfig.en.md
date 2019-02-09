---
title: "global Config"
date: 2019-01-01T11:02:05+06:00
type: "post"
weight: 4
---

The report platform must rely on the global configuration file{{< hl-text red >}}config.R{{< /hl-text >}}to run normally. The default global configuration file is in a subfolder of{{< hl-text red >}}/supernum{{< /hl-text >}}. You can modify some of them to suit your needs.  

The content of the global configuration file is roughly as follows. The global configuration file will be different for different editions or products with different systems.  
  
{{< codeblock "Setting global configuration variables" >}}
# Configure database connections
conn <- dbConnect(RSQLite::SQLite(), 'supernumV3.1.1.db')

# Setting global configuration variables
.config <- list(
  
  # Website title
  titleContent = "supernum",
  
  # If the title is too long, you can modify the titleWidth manually, for example"230px"、"15%"
  titleWidth = NULL,
  
  # Maximum times of Login attempt
  maxLoginTryTime = 5,
  
  # Name of tthe Public Account 
  publicAccountName = "publicAccount",
  
  # User Table
  tUsersPath = "__userTable__",
  tUsers = list(
    userName = "userName",
    password = "password",
    permission = "permission",
    lastActiveTime = "lastActiveTime",
    loginTryTime = "loginTryTime"
  ),
  
  # Available Reports View
  vAvailableReportsPath = "__availableReports__",
  vAvailableReports = list(
    reportName = "reportName",
    reportPath = "reportPath",
    reportUser = "reportUser",
    rowSub = "rowSub",
    colSub = "colSub"
  ),
)
{{< /codeblock >}}
<br>
At least you need to modify the connection information in {{< hl-text red >}} DB Configurate {{</hl-text >}} to test the successful connection information in the previous step (/installation/database/), and fill in the correct location and field name of the data resource management table.  
  
Of course, you may also need to change the default title of the website displayed by the reporting platform to the name of your company or organization. For the reporting platform with a user management system, you may also want to modify the user's {{< hl-text primary >}} maximum number of attempts to log in {{</hl-text >}} and {{< hl-text primary >}} public account name {{</hl-text >}} and other information.   
  
{{< alert danger >}} Note that you can only modify the values on the right side of the equals sign. Strings should be enclosed in double quotes, but numbers should not be used. {{< /alert >}} 
  
