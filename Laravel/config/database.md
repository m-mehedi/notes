# MySQL Code Reprepare troubleshoot
    
    ```
            'mysql' => [
            'options' => extension_loaded('pdo_mysql') ? array_filter([
                PDO::MYSQL_ATTR_SSL_CA => env('MYSQL_ATTR_SSL_CA'),
                PDO::ATTR_EMULATE_PREPARES => true
            ]) : [],
        ],
    ```