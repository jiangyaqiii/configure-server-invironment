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


#---------------------------------------------------------
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
