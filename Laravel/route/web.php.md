##  Method Chaining
```
Route::get('/blog/{id}', [PostsController::class, 'show'])
    ->where([
        'id' => '[0-9]+',
        'name' => '[A-Za-z]+'
    ]);

<!-- Fiirst route param is number & second one is alpha -->
    ->whereNumber('id')
    ->whereAlpha('name');
```

## Fallback Route
<!-- add in the bottom of `web.php` -->
Route::fallback(FallbackController::class)

<!-- define controller class -->
public function __invoke(){
     return view('fallback.index');
}
