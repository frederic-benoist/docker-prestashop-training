#!/bin/sh

echo "\n* Start configuring mail ..."
mysql -h $DB_SERVER -P $DB_PORT -u $DB_USER -p$DB_PASSWD $DB_NAME <<EOF
UPDATE ps_configuration SET value = 'contact@presta-trainin.fb' WHERE name='PS_SHOP_EMAIL';
UPDATE ps_configuration SET value = '2' WHERE name='PS_MAIL_METHOD';
UPDATE ps_configuration SET value = 'mailserver' WHERE name='PS_MAIL_SERVER';
UPDATE ps_configuration SET value = '1025' WHERE name='PS_MAIL_SMTP_PORT';
EOF
echo "\n* Configuring mail - Done"
