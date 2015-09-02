# php5.6-centos6-mysql5.6
One liner to install php 5.6 and mysql 5.6 on RHEL 6 architecture

```bash
git clone https://github.com/bradallenfisher/php5.6-centos6-mysql5.6.git; cd php5.6-centos6-mysql5.6; chmod 700 install.sh; chmod 700 post-install.sh; chown vagrant post-install.sh; mv post-install.sh /home/vagrant/; ./install.sh; cd /home/vagrant/;sudo su vagrant; ./post-install.sh
```
