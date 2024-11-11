=HugOps ~ CMS= 

# Hugo CMS server features 

In the context of
- Hugo Web framework +..
- PHP8 to add adome dynamism
- Apache 2.4 web server ..
- and Debian GNU / Linux 12 (or Ubuntu) server

The server is hosting some private digital 'assets' (pdf's, images, videos... )

Thus, this has to added functionality :

- How to give private access to some of our visitors ?

- How to  offer private access + newsletter and monthly renewed password for notification ?

This project website is called https://ourclub.org , for example.


## Private Access: based on Apache's 'Basich Auth '

Given that the mentioned 'assets' (pdf's, images, videos... ) are in the '/static/private' Hugo project folder ,

### How would you setup Apache's 'Basic Auth' mechanisms for  ?

We want the user to be prompted for 'user/passwd' whenever trying to acces the above mentioned folder , assets .

to set up Basic Auth for the /static/private folder in your Hugo project with Apache 2.4

####  Enable Apache Modules

Ensure Apache modules required for Basic Authentication are enabled.

```
sudo a2enmod auth_basic
sudo a2enmod authn_file
sudo systemctl restart apache2
```

#### Create a .htpasswd File

The .htpasswd file will store usernames and hashed passwords.

```
sudo htpasswd -c /etc/apache2/.htpasswd username
```

Repeat the command (without -c) for additional users:

```
sudo htpasswd /etc/apache2/.htpasswd anotheruser
```

#### Configure Apache for Basic Auth

Edit your Apache configuration file for the Hugo site (e.g., /etc/apache2/sites-available/ourclub.conf).

Add the following configuration to protect the /static/private folder:

```
<Directory /path/to/hugo/project/static/private>
    AuthType Basic
    AuthName "Private Access - OurClub"
    AuthUserFile /etc/apache2/.htpasswd
    Require valid-user
</Directory>
```
Restart Apache to apply changes:

```
sudo systemctl restart apache2
```

Now, any user trying to access files in /static/private will be prompted for credentials.

#### Automating Monthly Password Updates : PHP Script to Update Password

Create a PHP script to update the password. Save it as /home/ourclub/app/update_password.php.

```
<?php
// File: update_password.php

// Path to the .htpasswd file
$htpasswdFile = '/etc/apache2/.htpasswd';

// Generate a new random password
function generatePassword($length = 12) {
    return substr(bin2hex(random_bytes($length / 2)), 0, $length);
}

// Update .htpasswd with a new password for each user
$users = [
    'username1',
    'username2'
];
foreach ($users as $user) {
    $newPassword = generatePassword();
    // Hash the password
    $hashedPassword = password_hash($newPassword, PASSWORD_BCRYPT);
    // Replace or add user credentials
    file_put_contents($htpasswdFile, "$user:$hashedPassword\n", FILE_APPEND | LOCK_EX);
    // Notify admin (send via email manually in phase 1)
    echo "User: $user - New Password: $newPassword\n";
}
?>
```

Make the script executable:

```
chmod +x /home/ourclub/app/update_password.php
```

#####  Set Up a Cron Job

Use crontab to run the script monthly:

```
crontab -e

# Add the following line:


2 2 1 * * /usr/bin/php /home/ourclub/app/update_password.php > /dev/null
```

This will execute the script at 2:02 AM on the 1st of every month.

##### Manually Notify Users

After running the cron job, retrieve the updated passwords from the PHP script output and send them manually to users via email.


