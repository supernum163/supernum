---
title: "高级定制版展示"
date: 2019-01-01T11:02:05+06:00
type: "post"
weight: 4
---

### 报表平台框架  

用户打开报表平台后，将会看到上方的{{< hl-text primary >}}标题栏{{< /hl-text >}}，左侧的{{< hl-text primary >}}导航栏{{< /hl-text >}}和右侧的{{< hl-text primary >}}内容展示区域{{< /hl-text >}}。在移动端设备下，左侧的导航栏可能会被自动隐藏，用户需要点击标题栏的{{< hl-text orange >}}展开导航栏{{< /hl-text >}}才能将其展开。  

{{< image classes="clear fancybox fig-100" src="https://i.postimg.cc/jSp6gyfv/1.png" >}}  
  
  
### 用户管理

导航栏的上半部分是{{< hl-text blue >}}用户管理界面{{< /hl-text >}}。在未登录的情况下，用户将无法查看任何报告。点击{{< hl-text orange >}}登陆{{< /hl-text >}}将会出现登陆UI，输入相应的信息并点击{{< hl-text orange >}}确定登陆{{< /hl-text >}}，用户管理界面中将会显示登陆结果。登陆成功后将会自动展示用户所能查看的报表。  

{{< image classes="clear fancybox fig-100" src="https://i.postimg.cc/C1YGYYmq/2.png" >}}
<br>
用户也可以进行注册或该密操作。新注册的账号不会立即生效，必须等待管理员认证之后才能查看报表。若进行该密操作，用户需要首先登陆成功，再点击{{< hl-text orange >}}注册&该密{{< /hl-text >}}按钮，输入登陆时的用户名与新密码即可该密。  

{{< image classes="clear fancybox fig-100" src="https://i.postimg.cc/GpvFZ9JR/3.png" >}}  
  
  
###  报表管理

在导航栏中，我们为了节省空间，将原有的{{< hl-text purple >}}动态报表列表{{< /hl-text >}}替换成了{{< hl-text purple >}}动态报表筛选器{{< /hl-text >}}，用户可以通过下拉菜单筛选需要查看的报表，也可以直接输入报表名称进行筛选（筛选器自带模糊查询功能），选中报表后，内容展示区的报表界面、可视化界面、以及阅读记录、阅读进度等信息都会被更新。   
  
打开报表之后，用户可以点击报表的任意字段进行{{< hl-text green >}}排序{{< /hl-text >}}、可以{{< hl-text green >}}搜索{{< /hl-text >}}报表中的任意内容、可以{{< hl-text green >}}选择一页展示多少条数据{{< /hl-text >}}、可以{{< hl-text green >}}翻页{{< /hl-text >}}。  

{{< image classes="clear fancybox fig-100" src="https://i.postimg.cc/fTkxM8jB/6-v3.png" >}}   
  
  
### 可视化管理
  
用户点击导航栏的{{< hl-text cyan >}}报表可视化{{< /hl-text >}}后，可以在内容展示区打开可视化界面。这里我们提供了两种可视化解决方案：  

首先，用户可以在绘图选项中选定{{< hl-text yellow >}}x轴{{< /hl-text >}}与{{< hl-text yellow >}}y轴{{< /hl-text >}}对应的值，以及{{< hl-text yellow >}}图表类型{{< /hl-text >}}等信息，点击{{< hl-text orange >}}确定{{< /hl-text >}}就可以自行完成可视化工作。 这种可视化方案的系统维护成本非常低，但目前我们能够支持的图表类型仍然比较少，未来会进一步丰富。  

其次，系统管理员也可以为当前报表定义特定的可视化展示方式，这样用户打开可视化界面后可以直接查看可视化结果。这种方式可以展示更加高级、更加丰富的图表，但是需要系统管理员掌握一定的绘图命令。  

{{< image classes="fancybox fig-100" src="https://i.postimg.cc/KzNn8VHs/7.png">}}
{{< image classes="fancybox fig-50" src="https://i.postimg.cc/BtWDY0Lb/v3-08.png" >}}
{{< image classes="clear fancybox fig-50" src="https://i.postimg.cc/C5nks1K9/v3-09.png" >}}  
  
  
### 阅读记录管理

用户点击导航栏的{{< hl-text cyan >}}阅读记录{{< /hl-text >}}后，可以在内容展示区看到一张名为阅读记录的特殊报表，其中显示了所有用户可以阅读的报表，以及用户的阅读状态（已读、未读、报表有更新）和阅读次数。  

用户也可以点击标题栏中的{{< hl-text orange >}}报告总揽{{< /hl-text >}}按钮查看当前共有多少份报告、有多少份报告已读、有多少份报告未读、有多少份报告有更新，点击标题栏中的{{< hl-text orange >}}阅读进度{{< /hl-text >}}按钮查看当前的阅读进度。  

{{< image classes="clear fancybox fig-100" src="https://i.postimg.cc/BQy2b2ms/8.png" >}}  
  
  
### 留言管理

用户点击导航栏的{{< hl-text cyan >}}留言管理{{< /hl-text >}}后，可以在内容展示区打开留言界面。在留言界面中，用户输入留言接收者、留言有效期间、留言内容，再点击{{< hl-text orange >}}提交留言{{< /hl-text >}}就可以完成留言，接着留言结果被会展示在下方。  

用户也可以点击标题栏中的{{< hl-text orange >}}查收留言{{< /hl-text >}}按钮打开留言弹窗，接收留言信息。{{< hl-text red >}}注意未到生效日期或者已经过期的留言将不会被展示。{{< /hl-text >}}  

{{< image classes="clear fancybox fig-100" src="https://i.postimg.cc/xj6vrwHX/9.png"  >}}   
  
  
### 使用帮助

用户点击导航栏的{{< hl-text cyan >}}使用帮助{{< /hl-text >}}后，可以在内容展示区打开使用帮助界面。   

随着系统功能越来越复杂，用户可能需要一份帮助文档以便更好的了解系统的使用方法，帮助界面默认展示的就是本篇文档。当然我们也会根据您定制的内容，为您的用户制作合适的使用帮助文档。  
  