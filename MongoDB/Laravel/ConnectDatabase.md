## Connect Laravel App
### PHP Configuration
1. Download MongoDB PECL Package from: https://pecl.php.net/package/mongodb
2. Place `php_mongodb.dll` file in `php-8.1.3\ext` directory
3. Enable `mongodb` extension from laragon

### Composer Install
4. Run script `composer require jenssegers/mongodb`

### Configure Laravel App
5. Declare connection configuration in `config/database.php`
    ```
    'connections' => [
            'mongodb' => [
              'driver' => 'mongodb',
              'dsn' => env('DB_URI', 'mongodb://localhost:27017/'),
              'database' => 'dsr',
      ],
    ]
    ```
6. set default connection as mongodb  `config/database.php`
    `    'default' => env('DB_CONNECTION', 'mongodb'),`
7. add Library in providers array in `config/app.php` file
    ` Jenssegers\Mongodb\MongodbServiceProvider::class,`
8. declare mongodb connection to model `App\Models\User.php`
    `protected $connection = 'mongodb';`
9. define custom collection name in model [optional]
    `protected $collection = 'users';`
10. Update model library
    `use Jenssegers\Mongodb\Eloquent\Model;`
11. Add Fillable
    ```
        protected $fillable = [
            'title',
            'body',
            'slug'
        ]; 
    ```
12. Add authenticable to User model 
    `use Jenssegers\Mongodb\Auth\User as Authenticatable;`
    
### Configure .ENV file
```
DB_CONNECTION=mongodb
DB_HOST=127.0.0.1
DB_PORT=27017
DB_DATABASE=dsr
DB_USERNAME=MEHEDI 
DB_PASSWORD=12345678
```