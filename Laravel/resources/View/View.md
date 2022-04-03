### Check if view exists
`view()->exists('view.name')`

### View Share
On `AppServiceProvider ` declared view share on `boot` method
    `View::share('company_name', $details->company_name);`