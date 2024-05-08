#下载mongo4.4.4
# #解压缩
# tar -zxvf mongodb-linux-x86_64-rhel70-4.4.4.tgz
# #重命名
# mv mongodb-linux-x86_64-rhel70-4.4.4 mongodb
# cd mongo
# ##创建数据/日志文件夹
# mkdir data logs
# ##下载vim
# sudo yum update
# sudo yum install vim

# ##将配置写入mongodb.conf中
# echo '
# # 日志文件位置
# logpath=/root/mongo/logs/mongod.log
# # 以追加方式写入日志
# logappend=true
# # 是否以守护进程方式运行
# fork=true
# # 默认27017
# port = 27017
# #最大同时连接数
# maxConns=100
# # 数据库文件位置
# dbpath=/root/mongo/data
# # 允许哪个ip的连接，0.0.0.0表示任意ip都可以连接
# bind_ip=0.0.0.0
# # 是否以安全认证方式运行，默认是不认证的非安全方式，一开始安装启动不要开启，设置好密码后再重启
# #auth = true
# ' > mongodb.conf

# ##设置环境变量
# echo 'export PATH=/root/mongo/bin:$PATH' >> /etc/profile
# ##使环境变量生效
# source /etc/profile


#-------------------安装mongo--------------------------------------
#导入 MongoDB 的 GPG 公钥
sudo rpm --import https://www.mongodb.org/static/pgp/server-4.4.asc
#创建一个 repo 文件来获取 MongoDB 软件包
sudo echo '[mongodb-org-4.4]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.4/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.4.asc'
> /etc/yum.repos.d/mongodb-org-4.4.repo
#安装 MongoDB
sudo yum install -y mongodb-org
# 启动 MongoDB 服务
sudo systemctl start mongod
sudo systemctl status mongod

#-------------------安装python3.6.8--------------------------------------
sudo yum -y groupinstall "Development tools"
sudo yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel libffi-devel
wget https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tar.xz
# 解压包
tar -xvf Python-3.6.8.tar.xz
## 删除压缩包
rm -f Python-3.6.8.tar.xz
# 进入解压目录
cd Python-3.6.8
# 生成MakeFile
sudo ./configure --prefix=/usr/local/python3.6.8 --enable-optimizations
# 安装 使用make atinstall避免替换默认的python执行文件
sudo make altinstall
# 设置软连接到/user/bin/文件夹
sudo ln -s /usr/local/python3.6.8/bin/python3.6 /usr/bin/python3
sudo ln -s /usr/local/python3.6.8/bin/pip3.6 /usr/bin/pip3
# 更新pip
pip3 install --upgrade --user pip setuptools
# 更改pip源
mkdir ~/.pip
cd ~/.pip
echo '[global]
index-url=http://mirrors.aliyun.com/pypi/simple/

[install]
trusted-host=mirrors.aliyun.com'
> pip.conf

#-------------------安装需要用到的库--------------------------------------
# 下载Django
pip3 install Django==3.2.4
# 下载cronb
pip3 install crontab
pip3 install oss2==2.17.0
pip3 install python-dateutil==2.8.2
pip3 install bson
pip3 install pymongo==3.6.0
pip3 install redis==4.3.1
pip3 install msgpack
pip3 install zmail
# 下载svn
sudo yum install subversion
mkdir xinrun
cd xinrun
# svn拉取代码
echo svn用户名：hecao
echo svn密码：tSsuuTNv9p
svn checkout svn://116.62.198.65/repos/blackcat/branches/gedou_net_dev2/net

