#/!/bin/bash

# install apache
yum install httpd -y

# get some repos
rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm

wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -Uvh epel-release-6*.rpm

# get latest mysql
wget http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
yum localinstall mysql-community-release-el7-5.noarch.rpm -y
yum update -y
yum install mysql-community-server -y
systemctl enable mysqld.service
/bin/systemctl start  mysqld.service

# install some dev tools
yum groupinstall 'Development tools' -y

yum install --enablerepo=webtatic-testing php56w php56w-opcache php56w-cli php56w-common php56w-gd php56w-mbstring php56w-mcrypt php56w-pdo php56w-xml php56w-mysqlnd

# get varnish duh!
rpm --nosignature -i https://repo.varnish-cache.org/redhat/varnish-4.0.el6.rpm
yum install varnish -y
sed -i 's/VARNISH_LISTEN_PORT=6081/VARNISH_LISTEN_PORT=80/g' /etc/sysconfig/varnish
sed -i 's/Listen 80/Listen 8080/g' /etc/httpd/conf/httpd.conf

service varnish start
service httpd start

#get drush
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

echo "ON TO STEP 2...."
