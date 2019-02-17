---
title: "配置虚拟系统"
date: 2019-01-01T11:02:05+06:00
type: "post"
weight: 2
---

首先，您需要在[virtualbox官网](https://www.virtualbox.org/wiki/Downloads)中下载与您的操作系统相应的{{< hl-text green >}}virtualbox安装程序{{< /hl-text >}}与{{< hl-text green >}}VirtualBox扩展包{{< /hl-text >}}，扩展包可以让您的虚拟机与本机实现共享粘贴板、共享文件夹等功能，如果您不需要这些功能，也可以不用下载扩展包。

{{< image classes="clear fancybox fig-100" src="https://i.postimg.cc/YC9yKNhH/virtualbox.png" >}}

<br>
其次，您需要像安装普通软件一样安装**virtualbox安装程序**，安装完成后打开virtualbox软件，将**VirtualBox扩展包**拖入virtualbox界面即可安装扩展。  

再次，在virtualbox主界面点击{{< hl-text yellow >}}新建{{< /hl-text >}}，在打开的界面中配置适当的参数，选择{{< hl-text yellow >}}使用已有的虚拟硬盘文件{{< /hl-text >}}并点击查找文件选取我们提供给您的vdi硬盘文件，点击{{< hl-text yellow >}}创建{{< /hl-text >}}完成向导。

{{< image classes="clear fancybox fig-100" src="https://i.postimg.cc/zXpPc2D7/01.png" >}}

<br>
最后，您需要选中新建的虚拟机，并在virtualbox主界面点击{{< hl-text yellow >}}设置{{< /hl-text >}}，在设置界面中选择{{< hl-text yellow >}}网络{{< /hl-text >}}，将其中{{< hl-text blue >}}网卡1{{< /hl-text >}}的连接方式设为{{< hl-text cyan >}}桥接网卡{{< /hl-text >}}。

{{< image classes="clear fancybox fig-100" src="https://i.postimg.cc/hPK5MRnh/02.png" >}}

<br>
至此您的虚拟系统已经配置完成，您可以选中virtualbox中新生城的虚拟机，点击{{< hl-text yellow >}}启动{{< /hl-text >}}便可以像操作普通的操作系统一样启动我们的虚拟机。

{{< image classes="clear fancybox fig-100" src="https://i.postimg.cc/QNQzpxRR/03.png" >}}

<br>

> 注意，虚拟机的默认用户名与密码分别是**supernum**，**supernum**。您需要在登陆后的第一时间修改root用户的安全密码。  
  