Here is the fully provisioned vagrant box:

```bash
vagrant init bradallenfisher/centos-6.7-x86_64-php-5.6; vagrant up --provider virtualbox
```

It contains:
- php 5.6
- mysql 5.6
- varnish 4.0
  - needs vcl added
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
git clone https://github.com/bradallenfisher/php5.6-centos6-mysql5.6.git;cd php5.6-centos6-mysql5.6; vagrant up
```

- add below string to /etc/hosts file

192.168.19.56 local.php56.dev
