---
title: "VM Configurate"
date: 2019-01-01T11:02:05+06:00
type: "post"
weight: 2
---

First of all, you need to download the corresponding {{< hl-text green >}} VirtualBox installer {{</hl-text >}} and {{< hl-text green >}} VirtualBox extension package {{</hl-text >}} in [virtualbox official website](https://www.virtualbox.org/wiki/Downloads) for your operating system. Extension packages allow your virtual machine to share pasteboards, folders and other functions with the local machine. If you do not need these functions, you don't need to download the extension packages.

{{< image classes="clear fancybox fig-100" src="/images/download-VirtualBox.png" >}}

<br>
Secondly, you need to install **VirtualBox installer** just like normal software, open VirtualBox software after installation, and drag **VirtualBox extension package** into the VirtualBox interface to install the extension.  

Thirdly, click {{< hl-text yellow >}} create {{</hl-text >}} in the virtual box main interface, configure appropriate parameters in the open interface, select {{< hl-text yellow >}} use existing virtual hard disk file {{</hl-text >}} and click Find File to select the VDI hard disk file we provide you, click {{< hl-text yellow >}} create {{</hl-text >}} to complete the wizard.

{{< image classes="clear fancybox fig-100" src="/images/VM-Config_01.png" >}}

<br>
Finally, you need to select the new virtual machine, and click {{< hl-text yellow >}} settings {{</hl-text >}} in the virtual box main interface, select {{< hl-text yellow >}} network {{</hl-text >}} in the setting interface, and set the connection mode of {{< hl-text blue >}} network card 1{{</hl-text >}} to {{< hl-text cyan >}} bridge network card {{</hl-text >}}.

{{< image classes="clear fancybox fig-100" src="/images/VM-Config_02.png" >}}

<br>
So far, your virtual system has been configured. You can select the virtual machine of the new town of virtual box, click {{< hl-text yellow >}} start {{</hl-text >}}, and then you can start our virtual machine just like the ordinary operating system.

{{< image classes="clear fancybox fig-100" src="/images/VM-Config_03.png" >}}

<br>

> Note that the default user name and password of the virtual machine are **supernum**, **supernum**, respectively. You need to change the root user's security password at the first time after login.  
  