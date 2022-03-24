### Querying MongoDB 
Find using name
```
db.studentsInfoCollection.find({
    "name.firstName":"Sunil"
}).pretty();
```

#### Find using $eq, $lt, $gt
```
db.studentsInfoCollection.find({
    "name.firstName": {$eq:"Sunil"}
}).pretty();
```
```
db.studentsInfoCollection.find({
    "age": {$lt:13}
}).pretty();
```
```
db.studentsInfoCollection.find({
    "age": {$gt:12}
}).pretty();
```
#### $gte, $lte, $ne (not equal to), $in, $nin (not in)
```
db.studentsInfoCollection.find({
    "age": {$in:[12,16]}
}).pretty();
```
```
db.studentsInfoCollection.find({
    "age": {$exists: true, $in:[12,16]}
}).pretty();
```