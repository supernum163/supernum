---
title: "全局配置文件"
date: 2019-01-01T11:02:05+06:00
type: "post"
weight: 4
---

报表平台必须依赖全局配置文件{{< hl-text red >}}config.R{{< /hl-text >}}才能正常运行，全局配置文件默认存放在{{< hl-text red >}}/supernum{{< /hl-text >}}的子文件夹内。你可以修改其中的一部分内容，以适应您的需求。  
  
全局配置文件中的内容大致如下所示，对于不同版本或拥有不同系统的产品、其全局配置文件会有所不同。  
  
{{< codeblock "设定全局配置变量" >}}
# 配置数据库连接
conn <- dbConnect(RSQLite::SQLite(), 'supernumV3.1.1.db')

# 设定全局配置变量
.config <- list(
  
  # 网站标题，默认支持最多10个汉字
  titleContent = "极数科技",
  
  # 如果网站标题过长，可以修改titleWidth手动调节，例如"230px"、"15%"
  titleWidth = NULL,
  
  # 最大可尝试登陆次数
  maxLoginTryTime = 5,
  
  # 公用账号名称
  publicAccountName = "公用账号",
  
  # 用户管理表
  tUsersPath = "__用户管理__",
  tUsers = list(
    userName = "用户名称",
    password = "密码",
    permission = "是否准入",
    lastActiveTime = "最后一次登陆时间",
    loginTryTime = "最近一天尝试登陆次数"
  ),
  
  # 可用报表视图
  vAvailableReportsPath = "__可用报表__",
  vAvailableReports = list(
    reportName = "报表名称",
    reportPath = "报表位置",
    reportUser = "使用者",
    rowSub = "记录筛选",
    colSub = "字段筛选"
  )
)
{{< /codeblock >}}
<br>
这里您至少需要将{{< hl-text red >}}配置数据库连接{{< /hl-text >}}中的连接信息修改为您在[上一步](/installation/database/)测试成功的连接信息，并填写正确的数据资源管理表的位置与字段名称。  
  
当然您可能也需要将报表平台默认展示的网站标题修改为您公司或组织的名称，对于拥有用户管理系统的报表平台而言，您可能还想要修改用户的{{< hl-text primary >}}最大可尝试登陆次数{{< /hl-text >}}以及{{< hl-text primary >}}公用账号名称{{< /hl-text >}}等信息。   
  
{{< alert danger >}} 注意只能修改等号右边的值，字符串要用双引号括起来、数字则不用 {{< /alert >}} 
  
