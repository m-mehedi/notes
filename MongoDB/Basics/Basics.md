### Create Mongo Database
`use BlogREV`
### Show Databases
`show databases`
### Create Collection and Insert Document
```
db.articles.insert({
    name: 'MongoDB',
    category: 'Database',
    tags: ['NoSQL', 'DB', 'BigData']
})
```
### Creating a document
```
var articleInfo={};
articleInfo.articleName="MongoDB";
articleInfo.authorName="MEHEDI";
articleInfo.tags=["NoSQL","DBA","DEV"];

articleInfo.metaData={};
articleInfo.metaData.authors=["MEHEDI","HASAN"];
articleInfo.metaData.description="About MongoDB";
articleInfo.metaData.created_at=new Date();
db.articles.insertOne(articleInfo);
```
### Create Collections
using single parameter
`db.createCollection("users); `
```
db.createCollection("blogs"{
    capped: true,
    autoIndexId: true,
    size: 357000,
    max:1000
})
```
`show collections`
### Drop a collection
`db.users.drop();`
### View documents
`db.articles.find().pretty()`
### Drop Database
`use testDatabase`
`db.dropDatabase();`
`
