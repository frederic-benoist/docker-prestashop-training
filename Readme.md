# Docker PrestaShop - Training image

The image has Mysql, Apache and PHP installed with all modules and configuration required for Prestashop training. 

- Apache 2.4.latest (https://www.apache.org/) 
- PHP 7.4.latest (https://github.com/php)
- MySQL 8.0.latest (https://github.com/mysql)
- PrestaShop 1.7.8.latest (https://github.com/PrestaShop/PrestaShop)
- MailHog 1.0.1 (https://github.com/mailhog/MailHog)
- Xdebug 3.1.4 (https://github.com/xdebug/xdebug)
- Nvm 0.39.0 (https://github.com/nvm-sh/nvm)   
- NodeJS - 14.18.1 (https://github.com/nodejs)
- Composer 2.3.5 (https://github.com/composer/composer)

## Prerequisites

- you need to stop local web server and local mysql (Tcp port 80 and 3306 must be free).
- You need **docker**.

## Install

### Create directory and move in

```
mkdir training
cd training
```

### Clone this repository in created directory

```
git clone https://github.com/frederic-benoist/docker-prestashop-training.git .
```

### Start the docker-compose build.

```
docker-compose up --build
```

And wait...

### Check if all containers are up

```
docker ps
```

You will see 4 containers running
-pstraining_mailserver
-pstraining_phpmyadmin
-pstraining_mysql
-pstraining_www

### Add lines in your hosts file

The location of the file :
- Windows : C:\Windows\System32\drivers\etc\hosts
- Mac & Linux : /etc/hosts

The lines you need to add :
```
127.0.0.1   www.presta-training.fb
127.0.0.1   media1.presta-training.fb
127.0.0.1   media2.presta-training.fb
127.0.0.1   media3.presta-training.fb
```

## Usage

To access the PrestaShop Training front office :
-Navigate to http://www.presta-training.fb/

To access the PrestaShop Training back office :
-Navigate to http://www.presta-training.fb/admin-dev/
-Login : admin@presta-training.fb
-Password: training

To view emails sent by the store (With MailHog)
- Navigate to http://www.presta-training.fb:8025

To view the database (with PhpMyAdmin)
- Navigate to http://www.presta-training.fb:8080
-Login : root
-Password: root

## Authors

* **Frédéric BENOIST** - *Initial work* - [PrestaShop Trainer](https://www.fbenoist.com)

## Licensing
 
This image is released under the Academic Free License 3.0 (AFL-3.0)
that is bundled with this package in the file [License.md](License.md).

It is also available through the world-wide-web at this URL:
https://opensource.org/licenses/AFL-3.0
  
## DISCLAIMER
 
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
