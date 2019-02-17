---
title: "Access The Report Platform"
date: 2019-01-01T11:02:05+06:00
type: "post"
weight: 9
---

If you have completed the above steps, your report system has been built successfully in theory. Next, you may need to verify that the report platform is open properly or that your users can access the report platform.  

Here you just need to query the IP address of the virtual machine and tell your users about it. Your user can open the browser in any device in the same LAN, and enter the IP address of the virtual machine in the browser's address bar to access the report platform as if it were a normal website.  
  
{{< alert info >}}  Of course, if you know how to configure a LAN domain name, you can also bind a domain name to the IP address of the virtual machine, so that your users can access the report platform in the form of a domain name. {{< /alert >}} 
<br>
If you don't know how to use the IP address of the virtual machine, you can refer to the following steps:

Firstly, click {{< hl-text red >}}  system management area {{< /hl-text >}} in the upper right corner of virtual system and in the pop-up system management box clicking {{< hl-text yellow >}} settings {{< /hl-text >}} button.  

Secondly, in the open settings panel, click {{< hl-text red >}}  network {{< /hl-text >}}, click {{< hl-text yellow >}}  wired connection settings {{< /hl-text >}} button.  

Finally, the {{< hl-text green >}}  IPv4 address {{< /hl-text >}} displayed in the open network settings panel is the address of your virtual machine.   

{{< image classes="clear fancybox fig-100" src="https://i.postimg.cc/pLX3Vbc3/find-IPAddress.png" >}}   
