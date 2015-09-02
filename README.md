There is also a vagrant box available:

It contains:
- php 5.6
- mysql 5.6
- drush 7 via composer available to all users on the system.
- a drupal site at /var/www/html



# php5.6-centos6-mysql5.6
install php 5.6 and mysql 5.6 on RHEL 6 VM (like digitalocean or linode)

```bash
git clone https://github.com/bradallenfisher/php5.6-centos6-mysql5.6.git; cd php5.6-centos6-mysql5.6; chmod 700 install.sh; chmod 700 post-install.sh;
```
##optional

- add a user other than root
- mv the post-install.sh script to that user's home directory
- run the post-install.sh script as the new user

One liner to install php 5.6 and mysql 5.6 in vagrant (local machine)

```bash
https://github.com/bradallenfisher/php5.6-centos6-mysql5.6.git;cd php5.6-centos6-mysql5.6; vagrant up
```

