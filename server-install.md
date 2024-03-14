# Server installation

Installation (on Debian 12)

### Passwordless SSH

Add users
- adduser fenix

Add keys
- mkdir /home/fenix/.ssh
- nano /home/fenix/.ssh/authorized_keys
- chown -R fenix:fenix /home/fenix/.ssh

Add users to sudo group
- usermod -aG sudo fenix

Allow sudo without password
- nano /etc/sudoers

Add the following lines (and comment out old `%sudo` line):
%sudo ALL=(ALL) NOPASSWD: ALL

Set root password:
- apt install pwgen
- pwgen 16 
- passwd root

Modify the SSHd config:
- nano /etc/ssh/sshd_config

Change the line with “PasswordAuthentication” to:
- `PasswordAuthentication no`

Restart SSHd
- systemctl restart sshd

### Webserver install

Install mariadb / apache / php + dependencies packages
- apt install git wget gzip htop rsync curl less iotop ntp atop
- apt install apache2 libapache2-mpm-itk mariadb-client mariadb-server php-cli libapache2-mod-php php-curl php-gd php-igbinary php-intl php-mbstring php-memcache php-mysql php-pgsql php-redis php-sqlite3 php-xml php-zip memcached php-yaml

Install CertBot
- apt install certbot python3-certbot-apache

Disallow serving git repos
- echo 'RedirectMatch 403 /\.git' > /etc/apache2/conf-available/disallow-git.conf
- a2enconf disallow-git.conf

Enable mod rewrite and mod ssl and restart
- a2enmod rewrite
- a2enmod ssl
- systemctl restart apache2

Enable firewall
- ufw allow 22
- ufw allow 443
- ufw allow 80
- ufw enable

### Automatic updates

Install automatic updates
- apt-get install unattended-upgrades
- dpkg-reconfigure unattended-upgrades
