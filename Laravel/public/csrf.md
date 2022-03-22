# CSRF Token - Cross-site Request Forgery
    ```
    $token = $request->session()->token();
    $token = csrf_token();
    ```

    <!-- This is how we can apply CSRF security -->
    ## Blade
    @csrf
    `<input type="hidden" name="_token" value="{{ csrf_token }}" />`

    ## in AJAX (X-CSRF-TOKEN)
    ```
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    ```