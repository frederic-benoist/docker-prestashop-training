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

echo "\n* Start uninstalling and removing useless modules ..."

remove_module emarketing
remove_module ps_eventbus
remove_module statsvisits
remove_module ps_accounts

uninstall_module gamification
remove_module gamification

uninstall_module ps_checkout
remove_module ps_checkout

uninstall_module psaddonsconnect
remove_module psaddonsconnect

uninstall_module welcome
remove_module welcome

uninstall_module ps_metrics
remove_module ps_metrics

uninstall_module ps_facebook
remove_module ps_facebook

uninstall_module psxmarketingwithgoogle
remove_module psxmarketingwithgoogle

uninstall_module ps_mbo
remove_module ps_mbo

echo "\n* Uninstalling and removing useless modules - Done"
