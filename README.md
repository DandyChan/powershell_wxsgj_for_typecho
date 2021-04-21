# 在PowerShell上运行的微信时光机发送端

> 时光机的页面改来改去，总改不出个所以然（~~主要是我太菜了~~），还是保持现状吧，想着另外搞一个能在PC发送的网页却因为跨域啥的奇怪问题卡住...... 晚上闲着，在PowerShell上用CURL试了一下提交，发现居然直接成功了！去他的跨域！但是命令行也太内个了，于是花费了点时间搞了这玩意出来。

### 原文链接
https://katcloud.cn/archives/79.html

### 前提条件

有使用SNGR大佬的[微信时光机](https://sngr.org/index.php/archives/2018/09/10/wxsgj.html/comment-page-2#comments)

### 使用方法

https://github.com/DandyChan/powershell_wxsgj_for_typecho

clone，下载什么的都可以。

右键编辑`sgj.ps1`中的`$sourceApi`

```powershell
$sourceApi = '你的域名/wxindex.php'
```

修改完后右键运行就可以了。也可以通过设置系统变量`Path`利用`win + R`快速运行。

### 功能

用奇怪的方式实现了在PC（PowerShell）上发送时光机到博客。

### 截图

令人惊叹的返璞归真的UI设计：

<img src="https://katcloud-blog.oss-cn-hangzhou.aliyuncs.com/blog/20210403192325.png" alt="朴(chou)实(dao)无(bao)华(zha)的界面" style="zoom:50%;" />

<img src="https://katcloud-blog.oss-cn-hangzhou.aliyuncs.com/blog/20210403192519.png" alt="肉眼可见的空字符检测" style="zoom:70%;" />

![成功发送后“贴心”的提示](https://katcloud-blog.oss-cn-hangzhou.aliyuncs.com/blog/20210403192712.png)

