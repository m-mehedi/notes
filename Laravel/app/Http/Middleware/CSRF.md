### CSRF Bypass
`app/Http/Middleware/VerifyCsrfToken.php`
Add route exception to verify
```
    protected $except = [
        '/api/*'
    ];
```