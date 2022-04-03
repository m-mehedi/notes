## Localization
### Create a middleware
`php artisan make:middleware Localization`

### Configure middleware
    ```
    <?php
            namespace App\Http\Middleware;
            use Closure;
            use Illuminate\Http\Request;
            use Illuminate\Support\Facades\App;
            use Illuminate\Support\Facades\Session;
            class Localization
            {
                /**
                * Handle an incoming request.
                *
                * @param  \Illuminate\Http\Request  $request
                * @param  \Closure  $next
                * @return mixed
                */
                public function handle(Request $request, Closure $next)
                {
                    if (Session::has('locale')) {
                        App::setLocale(Session::get('locale'));
                    }
                    return $next($request);
                }
            }
    ```
### Add middleware to `app/http/Kernel.php` web middleware group
`\App\Http\Middleware\Localization::class,`

### Configure route
```
Route::get('language/{locale}', function ($locale) {
    app()->setLocale($locale);
    session()->put('locale', $locale);
    return redirect()->back();
});
```
