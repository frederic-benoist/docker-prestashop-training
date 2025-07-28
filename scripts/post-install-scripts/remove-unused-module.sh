#!/bin/sh

uninstall_module(){
  echo "\n* Uninstall $1"
  runuser -g www-data -u www-data -- php -d memory_limit=-1 /var/www/html/bin/console \
    prestashop:module uninstall $1
}

remove_module(){
  echo "\n* Remove $1"
  rm -rf /some /var/www/html/modules/$1
}

echo "\n* Start removing useless modules ..."

remove_module emarketing
remove_module ps_eventbus
remove_module statsvisits
remove_module ps_accounts
remove_module gamification
remove_module ps_checkout
remove_module psaddonsconnect
remove_module welcome
remove_module ps_metrics
remove_module ps_facebook
remove_module psxmarketingwithgoogle
remove_module ps_mbo

echo "\n* Removing useless modules - Done"
