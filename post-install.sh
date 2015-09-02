#!/bin/bash

curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
composer global require drush/drush:7.*
export PATH="$HOME/.composer/vendor/bin:$PATH"

# install drush recipes
drush dl drush_recipes -y
drush dl drupal --destination=/var/www/ --drupal-project-rename=html -y

cd /var/www/html
drush site-install --db-url=mysql://root@localhost:22/test -y
chmod -R 755 /var/www/html/sites/default/files/
chown -R apache:apache /var/www/html/sites/default/files/
exec bash

echo "DUNZY!"
