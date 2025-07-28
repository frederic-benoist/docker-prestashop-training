#!/bin/sh

echo "\n* Start install hummingbird  ..."

cd /var/www/html/themes
git clone https://github.com/PrestaShop/hummingbird.git

echo "\n* Install all module  ..."
cd /var/www/html/themes/hummingbird
npm ci

echo "\n* Create .env  ..."
cd /var/www/html/themes/hummingbird/webpack
COPY /var/www/html/themes/hummingbird/webpack/.env-example /var/www/html/themes/hummingbird/webpack/.env
sed -E -i -e 's/domain.local/www.presta-training.fb/' /var/www/html/themes/hummingbird/webpack/.env

echo "\n* Build assets ..."
cd /var/www/html/themes/hummingbird
npm run build

echo "\n* chmod ..."
chmod -R 777 /var/www/html/themes/hummingbird

cd /var/www/html
echo "\n* End install hummingbird  ..."
