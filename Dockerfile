FROM prestashop/prestashop:8.2.0-8.1-apache

ENV NODE_VERSION=20.19.4
ENV NVM_DIR=/root/.nvm
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"

# Install git, xdebug, npm and nodeJs
RUN \
  apt-get update \
  && apt-get install -y --no-install-recommends git \
  && pecl install xdebug-3.1.4 \
  && echo "xdebug.mode=develop,debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
  && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
  && echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
  && echo "xdebug.discover_client_host=0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
  && echo "xdebug.client_port=9003" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
  && echo "xdebug.client_host=172.17.0.1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
  && echo "xdebug.log_level = 0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
  && echo "xdebug.idekey=VSCODE" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
  && sed -E -i -e 's/post_max_size = 20M/post_max_size = 128M/' /usr/local/etc/php/php.ini \
  && sed -E -i -e 's/upload_max_filesize = 20M/upload_max_filesize = 128M/' /usr/local/etc/php/php.ini \
  && sed -E -i -e 's/SMTP = localhost/SMTP = mailserver/' /usr/local/etc/php/php.ini \
  && sed -E -i -e 's/smtp_port = 25/smtp_port = 1025/' /usr/local/etc/php/php.ini \
  && docker-php-ext-enable xdebug \
  && a2enmod env expires headers deflate \
  && echo "ServerName www.presta-training.fb" >> /etc/apache2/apache2.conf \
  && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash \
  && . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION} \
  && . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION} \
  && . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION} \
  && node --version \
  && npm --version \
  && apt-get clean && apt-get autoclean && apt-get autoremove

# Install configuration files
COPY ./config/presta-training.conf /etc/apache2/sites-available/000-default.conf
COPY ./config/.htaccess /var/www/html/.htaccess
COPY ./config/.vscode /var/www/html/.vscode

# Install post-install-scripts
COPY ./scripts/post-install-scripts /tmp/post-install-scripts

# Install composer
COPY --from=composer:2.3.5 /usr/bin/composer /usr/local/bin/composer

