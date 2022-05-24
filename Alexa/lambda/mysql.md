## STEP: 01 (Dependencies)
1. Add dependencies to `package.json`
`"mysql": "^2.18.1"`
2. Require packages
`const mysql = require('mysql');`

## STEP: 02 (Connection)
```
const con = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME
});
```

## STEP: 03 (USAGE)
```
con.connect(function(err) {
    if(err){
      console.log("Error in the connection")
      console.log(err)
    }
    else{
      console.log(`Database 2 Connected`);
    }
})
```
### Use in same main file
```
con.connect(function(err) {
    if(err){
        console.log("Error in the connection")
        console.log(err)
    }
    else{
        console.log(`Database 1 Connected`);
    }
})
con.query(`TRUNCATE doctors`);
con.query(`INSERT INTO doctors select * from doctors_backup`);
con.end();
```

### Export Variable from different file
```
con.query('SELECT count(id) as doctors from doctors', function (error, results, fields) {
  if (error) throw error;
  console.log(`Total doctors are ${c.convert(results[0].doctors)}`);
  
  module.exports.dsrdoctors = `There are ${c.convert(results[0].doctors)} doctors`;
  module.exports.doctors = `${(results[0].doctors/100000).toFixed(2)} Lc`;
});
```