# Rewrite condition
    RewriteCond %{HTTP_REFERER} !^http://www.fcn.rnderp.com/.*$      [NC]
    RewriteCond %{HTTP_REFERER} !^http://www.fcn.rnderp.com$      [NC]
    RewriteCond %{HTTP_REFERER} !^https://fcn.rnderp.com/.*$      [NC]
    RewriteCond %{HTTP_REFERER} !^https://fcn.rnderp.com$      [NC]
    RewriteCond %{HTTP_REFERER} !^https://www.fcn.rnderp.com/.*$      [NC]
    RewriteCond %{HTTP_REFERER} !^https://www.fcn.rnderp.com$      [NC]
    RewriteRule .*\.(jpg|jpeg|gif|png|bmp)$ - [F,NC]

# Apache rewrite for Laravel /public
    - 1. Alternate installation path with symlink
        This is the preferred solution and in general an all-around good idea. It's possible to install your application to a folder unrelated to public_html/ and then symlink the public folder to the public_html/ path.
        For example:
        Install your application to /home/applications/mysite.com
        Imagine that your DocumentRoot points to /var/www/vhosts/mysite.com/httpdocs
        Remove the httpdocs folder from the mysite.com vhosts folder then connect the two with a symlink: ln -s /home/applications/mysite.com/public /var/www/vhosts/mysite.com/httpdocs
    - 2.  .htaccess with mod_rewrite
        This solution enables you to drop Laravel into your public folder then use a .htaccess file to redirect requests to the public folder. This solution places your application and core system code into a publicly accessible folder. This is not something that we encourage you to do with any PHP framework.
        - Step 1. Place Laravel in your document root folder.
        - Step 2. Place the following .htaccess file in your document root folder.
            ```<IfModule mod_rewrite.c>
                RewriteEngine on
                RewriteCond %{REQUEST_URI} !^public
                RewriteRule ^(.*)$ public/$1 [L]
            </IfModule>```
        - Step 3. Make sure that you manually set your 'url' configuration in application/config/application.php otherwise Laravel will generate incorrect URLs. Make sure that each of your environments have the correct application.url configuration. For more information on environment-specific configurations see: http://laravel.com/docs/install#environments

    - 3. merge the public folder into the installation root
        This solution places your application and core system code into a publicly accessible folder. This is not something that we encourage you to do with any PHP framework.
        Copy the contents of the public/ folder into your Laravel installation folder then change this line in your index.php file from:
        ```require '../paths.php';```
        to
        ```require 'paths.php';```
        Keep in mind that any bundles, libraries, or other types of third-party code may not be designed to be publicly accessible.

# 