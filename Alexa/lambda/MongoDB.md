## Step: 01 (Dependencies)
1. Add dependencies to `package.json`
`"mongodb": "^3.6.9"`

## STEP: 02 (Connect Database)
`MONGODB=mongodb+srv://mehedi:654321Mm@alexa.dhj8s.mongodb.net/SKF`

## STEP: 03 (Require MongoDB)
`var MongoClient = require('mongodb').MongoClient;`
`var MongoDB = process.env.MONGODB;`

## STEP: 04 (Usage)
```
//Mongo DB
        await MongoClient.connect(MongoDB, {useUnifiedTopology: true, useNewUrlParser: true }, function(err, db) {
          if (err) throw err;
          var dbo = db.db("SKF");
          var AHD = { 
            Address: ADDRESS_MESSAGE,
                Name: userName,//profileName,
                Email: userEmail,// profileEmail,
                Phone: '0'+ profileMobile,
           };
          dbo.collection("AHD").insertOne(AHD, function(err, res) {
            console.log('Inserted!');
            if (err) throw err;
            console.log(err)
            db.close();
          });
        });
```
    