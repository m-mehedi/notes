### Get Users
`db.getUsers()`

### Create Users
```
db.createUser({
    user:"MEHEDI",
    pwd:"12345678",
    roles:[
        {
            role:"userAdmin",
            db:"classInfo"
        }
    ]
})
```