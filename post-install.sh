#!/bin/bash

composer global require drush/drush:7.*
export PATH="$HOME/.composer/vendor/bin:$PATH"

# install drush recipes
drush dl drush_recipes -y
sudo chown -R vagrant:vagrant /var/www/
drush dl drupal --destination=/var/www/ --drupal-project-rename=html -y

cd /var/www/html
drush site-install --db-url=mysql://root@localhost:22/test -y
chmod -R 755 /var/www/html/sites/default/files/
chown -R apache:apache /var/www/html/sites/default/files/
exec bash

echo "DUNZY!"
