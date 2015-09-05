#/!/bin/bash

# install apache
yum install httpd -y

# get some repos
rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm

wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -Uvh epel-release-6*.rpm

# get latest mysql
wget http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
yum localinstall mysql-community-release-el6-5.noarch.rpm -y
yum update -y
yum install mysql-community-server -y
service mysqld start
chkconfig mysqld on

# install some dev tools
yum groupinstall 'Development tools' -y

yum install -y --enablerepo=webtatic-testing php56w php56w-opcache php56w-cli php56w-common php56w-gd php56w-mbstring php56w-mcrypt php56w-pecl-apcu php56w-pdo php56w-xml php56w-mysqlnd

# get varnish duh!
rpm --nosignature -i https://repo.varnish-cache.org/redhat/varnish-4.0.el6.rpm
yum install varnish -y
sed -i 's/VARNISH_LISTEN_PORT=6081/VARNISH_LISTEN_PORT=80/g' /etc/sysconfig/varnish
sed -i 's/Listen 80/Listen 8080/g' /etc/httpd/conf/httpd.conf


service varnish start
chkconfig varnish on
service httpd start
chkconfig httpd on

curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
ln -s /usr/local/bin/composer /usr/bin/composer
composer global require drush/drush:7.*

#make sure you can index with php and use clean urls in drupal
touch /etc/httpd/conf.d/domains.conf

cat << EOF > /etc/httpd/conf.d/domains.conf

NameVirtualHost *:8080

<VirtualHost *:8080>
  DocumentRoot /var/www/html
  ServerName local.php56.dev
</VirtualHost>

<Directory /var/www/html>
  AllowOverride None
  Order allow,deny
  allow from all
  Include /var/www/html/.htaccess
</Directory>
EOF

echo "ON TO STEP 2...."
