

在阿里云esc上搭建tomcat

### 需要工具

windows软件winscp

windows软件putty

liunx的jdk

liunx的tomcat



### 购买云服务器和域名

##### 阿里云服务器和域名

购买的linux的os8

##### 增加端口

购买云服务器后选择实例

选择安全组

选择配置规则

```
添加443端口,tomcat
协议类型:自定义tcp,端口范围:433/433,授权对象:0.0.0.0,
添加80端口,tomcat
协议类型:自定义tcp,端口范围:80/80,授权对象:0.0.0.0,
```



### 安装服务器端软件

```
//用putty或阿里云自带web方法登录
用户名root,密码为服务器实例那里能重置
cd /home/
mkdir pan
//用winscp,实例的ip地址
将jdk和tomcat上传到/home/pan 
//安装jdk,用putty登录服务器,进入/home/pan
tar -zxvf jdk-15.0.2_linux-x64_bin.tar.gz
mv jdk-15.0.2/ /usr/local/
rm jdk-15.0.2_linux-x64_bin.tar.gz
tar -zxvf apache-tomcat-9.0.44.tar.gz
rm apache-tomcat-9.0.44.tar.gz
//重命名为tomcat
mv apache-tomcat-9.0.44/ tomcat/    
//配置服务器的java环境变量,下载的jdk是jdk-15.0.2
export JAVA_HOME=/usr/local/jdk-15.0.2
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
//用vim命令编辑
vim /etc/profile
光标移动到文件尾部
键盘按i,转为输入状态
右键点击,自动粘贴上上面3个export
键盘按esc键退出编辑状态
按 :
输入 wq   //保存退出
重启云服务器
重启后用putty登录服务器端
//测试java
java -version
//启动tomcat
cd /home/pan/tomcat/conf
//更改配置文件server.xml
vim server.xml
//更改8080为80端口
<Connector prot="8080" protocol ="HTTP/1.1"
改为: ="80",其他不变
//保存退后
esc键
wq
//到tomcat/bin里启动tomcat
cd /home/pan/tomcat/bin
./startup.sh
可以浏览了
```



### 阿里云https服务

登录阿里云

找ssl证书,购买免费的

进入ssl菜单

找到"证书申请"

申请后填写相应信息和需要绑定的域名

//开始安装ssl到服务器实例上

在前面的页面上找到"下载"

根据服务类型下载对应的文件

下载tomcat对应的zip文件,下载完成后解压出2个文件

旁边有"帮助"

//用putty登录服务器

cd /home/tomcat

新建cert文件夹

//解压后2个文件复制到cert里

//在服务器里安全规则里添加443端口

//修改tomcat的server.xml

cd /home/pan/tomcat/conf

vim server.xml

按 i 键进入编辑状态

复制下面内容,在复制前修改对应值

```
<Connector  port="8443"
protocol="HTTP/1.1"
  SSLEnabled="true"
  maxThreads="150" scheme="https" secure="true"
  clientAuth="false" sslProtocol="TLS" />
```



```
<Connector port="443"   #port属性根据实际情况修改（https默认端口为443）。如果使用其他端口号，则您需要使用https://yourdomain:port的方式来访问您的网站。
    protocol="HTTP/1.1"
    SSLEnabled="true"
    scheme="https"
    secure="true"
    keystoreFile="/home/pan/tomcat/cert/domain name.pfx" #证书名称前需加上证书的绝对路径，请使用您证书的文件名替换domain name。
    keystoreType="PKCS12"
    keystorePass="证书密码"  #请替换为密码文件pfx-password.txt中的内容。
    clientAuth="false"
    SSLProtocol="TLSv1+TLSv1.1+TLSv1.2"
    ciphers="TLS_RSA_WITH_AES_128_CBC_SHA,TLS_RSA_WITH_AES_256_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256,TLS_RSA_WITH_AES_128_CBC_SHA256,TLS_RSA_WITH_AES_256_CBC_SHA256"/>
```

//关闭tomcat

./shutdown.sh

//再开启

./startup.sh