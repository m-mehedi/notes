### Create Index
check nscannedObjects
`db.studentsInfoCollection.find({age:13}).explain()`
create index
`db.studentsInfoCollection.createIndex({age:1})`

### Find Index
`db.studentsInfoCollection.getIndexes()`

### Drop Index
`db.studentsInfoCollection.dropIndex({age:1})`
