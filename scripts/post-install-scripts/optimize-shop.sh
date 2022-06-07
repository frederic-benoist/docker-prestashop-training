#!/bin/sh

echo "\n* Sart configuring Smarty and CCC..."
mysql -h $DB_SERVER -P $DB_PORT -u $DB_USER -p$DB_PASSWD $DB_NAME <<EOF
INSERT INTO ps_configuration (name, value, date_add, date_upd)
  VALUES
    ('PS_SMARTY_FORCE_COMPILE', '1', curdate(), curdate()),
    ('PS_CSS_THEME_CACHE', '1', curdate(), curdate()),
    ('PS_JS_THEME_CACHE', '1', curdate(), curdate()),
    ('PS_HTACCESS_CACHE_CONTROL', '1', curdate(), curdate())
;
EOF
echo "\n* Configuring Smarty and CCC - Done"

echo "\n* Start configuring media servers..."
mysql -h $DB_SERVER -P $DB_PORT -u $DB_USER -p$DB_PASSWD $DB_NAME <<EOF
INSERT INTO ps_configuration (name, value, date_add, date_upd)
  VALUES
    ('PS_MEDIA_SERVERS', '1', curdate(), curdate()),
    ('PS_MEDIA_SERVER_1', 'media1.presta-training.fb', curdate(), curdate()),
    ('PS_MEDIA_SERVER_2', 'media2.presta-training.fb', curdate(), curdate()),
    ('PS_MEDIA_SERVER_3', 'media3.presta-training.fb', curdate(), curdate())
;
EOF
echo "\n* Configuring media servers - Done"
