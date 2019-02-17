---
title: "Custom Edition"
date: 2019-01-01T11:02:05+06:00
type: "post"
weight: 4
---

### The Framework  

When the user opens the report platform, he will see {{< hl-text primary >}} title bar {{</hl-text >}} above, {{< hl-text primary >}} navigation bar {{</hl-text >}} on the left and {{< hl-text primary >}} content display area {{</hl-text >}} on the right. Under mobile devices, the navigation bar on the left side may be hidden automatically. Users need to click on {{< hl-text orange >}} of the title bar to expand the navigation bar {{</hl-text >}} to expand it.  

{{< image classes="clear fancybox fig-100" src="https://i.postimg.cc/x16DLTb0/1-framework.png" >}}  
  
  
### User Management

The upper half of the navigation bar is {{< hl-text blue >}} User Management Interface {{< /hl-text >}}. Without login, users will not be able to view any reports. The login UI will appear when you click on the {{< hl-text orange >}} Login {{< /hl-text >}} button, enter the corresponding information and click {{< hl-text orange >}} Confirm {{< /hl-text >}} and the login result will be displayed in the user management interface. When the login is successful, the report that the user can view will be displayed automatically.   

{{< image classes="clear fancybox fig-100" src="https://i.postimg.cc/VN5ygQjX/2-user-Login.png" >}}
<br>
Users can also register or operate on the secret. The newly registered account will not take effect immediately. You must wait for the administrator to authenticate before you can view the report. If the secret operation is performed, the user needs to login successfully first, then click {{< hl-text orange >}} Modify {{< /hl-text >}} button, and enter the user name and new password at the time of login.

{{< image classes="clear fancybox fig-100" src="https://i.postimg.cc/N0n3PJ4S/3-user-Modify.png" >}}  
  
  
###  Report Management

In the navigation bar, in order to save space, we give the original {{< hl-text purple >}}dynamic report list{{< /hl-text >}} to {{< hl-text purple >}}dynamic report filter{{< /hl-text >}}. Users can select reports that need to be viewed through the drop-down menu, or directly enter the report name for screening (The filter has a fuzzy query function). After selecting the report, the Report interface, Visualization interface, and Reading History interface and other information will be updated automatically.    

After opening the report, users can click on any column of the report to {{< hl-text green >}} sort {{</hl-text >}} , {{< hl-text green >}} search {{</hl-text >}} for any content in report, {{< hl-text green >}} select how many rows shell be displayed on one page {{</hl-text >}}, and {{< hl-text green >}} navigate pages {{</hl-text >}}.

{{< image classes="clear fancybox fig-100" src="https://i.postimg.cc/KjPCjZ2h/6-select-Report.png" >}}   
  
  
### Visualization Management

After users click {{< hl-text cyan >}} Visualization {{</hl-text >}} on the navigation bar report, they can open the visualization interface in the content display area. Here we provide two visualization solutions:  

Firstly, users can select the corresponding values of {{< hl-text yellow >}}x axis {{</hl-text >}} and {{< hl-text yellow >}}y axis {{</hl-text >}} in the drawing options, as well as the information of {{< hl-text yellow >}} chart type {{</hl-text >}}, and click {{< hl-text orange >}} Check {{</hl-text >}} to complete the visualization work on their own. The system maintenance cost of this visualization scheme is very low, but at present we can support fewer types of graphs, which will be further enriched in the future.  

Secondly, the system administrator can also define a specific visual presentation for the current report, so that users can view the visual results directly after opening the visual interface. This way can show more advanced and rich charts, but it requires the system administrator to master certain drawing commands.  

{{< image classes="fancybox fig-100" src="https://i.postimg.cc/NFqWQKZx/7-visualization.png">}}
{{< image classes="fancybox fig-50" src="https://i.postimg.cc/vBN5n9GW/v3-08-plot.png" >}}
{{< image classes="clear fancybox fig-50" src="https://i.postimg.cc/yddFWnC1/v3-09-plot.png" >}}  
  
  
### Reading History Management

After users click {{< hl-text cyan >}} Reading History {{</hl-text >}} on the navigation bar, they can see a special report named reading record in the content display area, which shows the report that all users can read, as well as the user's reading status (read, unread, report update) and reading times.  

Users can also click the {{< hl-text orange >}} report overview {{</hl-text >}} button in the title bar to see how many reports have been read, how many reports have not been read, and how many reports have been updated. Click the {{< hl-text orange >}} reading progress {{</hl-text >}} button in the title bar to see the current reading progress.
  
{{< image classes="clear fancybox fig-100" src="https://i.postimg.cc/TYcZXY0r/8-reading-History.png" >}}  
  
  
### Message Management

After users click {{< hl-text cyan >}} message management {{</hl-text >}} on the navigation bar, they can open the message interface in the content display area. In the message interface, the user enters the recipient, validity period and content of the message, then clicks {{< hl-text orange >}} submit {{</hl-text >}} to complete the message, and the result of the message will be displayed below.  

Users can also click the {{< hl-text orange >}} check message {{</hl-text >}} button in the title bar to open the message bullet window and receive message information.  

{{< alert warning >}} Messages that have not reached the effective date or expired will not be displayed.  {{< /alert >}}

{{< image classes="clear fancybox fig-100" src="https://i.postimg.cc/gkpf56Vz/9-message.png"  >}}   
  
  
### User Guide

After users click {{< hl-text cyan >}} User Guide {{</hl-text >}} on the navigation bar, they can open the help interface in the content display area.  

As the functions of the system become more and more complex, users may need a help document to better understand the use of the system. The default display of the help interface is this document. Of course, according to your customized content, we will also produce appropriate usage help documents for your users.  
