#  linux/windows 系统安装

安装教程：https://blog.csdn.net/u014422976/article/details/80393841

安装后遇到的问题

### 1 无法联网

台式机没有无线网卡，不能连接无线网

有线网络的连接：

![](https://i.loli.net/2018/11/14/5beb9b58c28f9.jpg)

&nbsp;

![1542167463787](C:\Users\feng\AppData\Roaming\Typora\typora-user-images\1542167463787.png)

&nbsp;

### 2 上下左右，退格键乱码

1.`sudo -i`进入root

2.编辑/etc/vim/vimrc.tiny。将set compatible改成noncompatible。   解决上下左右的问题

3.在上面一句后添加set backspace=2。解决退格键的问题



### 3 安装linux后，无法启动windows

挂载，`mount`是什么意思： https://blog.csdn.net/daydayup654/article/details/78788310

`sudo fdisk /dev/sda`查看分区信息

命令（输入m获取帮助）：p（打印分区表）

*参考解决方案*：

https://blog.csdn.net/aBlueMouse/article/details/78157673

这篇特别好！！！！https://www.jianshu.com/p/5007e555ec12

修复Ubuntu18.04与Windows 10双系统丢失grub引导界面 https://blog.csdn.net/weixin_39212776/article/details/81239805





### 4 linux系统文件配置

### 5 linux kylin版本中文终端改默认语言为英文

`sudo vim /etc/default/locale`

~~~linux
中文设置为：
LANG="zh_CN.UTF-8"
LANGUAGE="zh_CN:zh"
LANG="zh_CN.UTF-8"
LANGUAGE="zh_CN:zh"
~~~

将上面内容的zh都换成en。CN换成US。然后注销或重启系统





# windows子系统安装zsh

~~~linux
Unable to locate package <package>
~~~

firstly **Make sure you have enabled Ubuntu repositories:**

~~~linux
sudo add-apt-repository main
sudo add-apt-repository universe
sudo add-apt-repository restricted
sudo add-apt-repository multiverse
~~~

solve!!



