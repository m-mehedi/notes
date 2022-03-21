# Rewrite condition
    RewriteCond %{HTTP_REFERER} !^http://www.fcn.rnderp.com/.*$      [NC]
    RewriteCond %{HTTP_REFERER} !^http://www.fcn.rnderp.com$      [NC]
    RewriteCond %{HTTP_REFERER} !^https://fcn.rnderp.com/.*$      [NC]
    RewriteCond %{HTTP_REFERER} !^https://fcn.rnderp.com$      [NC]
    RewriteCond %{HTTP_REFERER} !^https://www.fcn.rnderp.com/.*$      [NC]
    RewriteCond %{HTTP_REFERER} !^https://www.fcn.rnderp.com$      [NC]
    RewriteRule .*\.(jpg|jpeg|gif|png|bmp)$ - [F,NC]