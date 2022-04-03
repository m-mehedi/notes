### Aggregate
- Insert Data
```
db.posts.insertOne({
    title:"Post 1",
    description:"Desc 1",
    author:"Mehedi",
    url:"m.me/mehediatfacebook",
    tags:['No Sql','Big Data'],
    likes: 120
});
```
- Aggregate function
```
db.posts.aggregate({
    $group: {
        _id:"author",
        total_post:{$sum:1}
    }
})
```

### Distinct
`db.posts.distinct("author")`

### Count
`db.posts.find({ "tags":"MySQL" }).count()`

### Sort
`db.posts.find().sort({ likes:-1 })`
 - $natural=1

### Sum
```
db.posts.aggregate({
    $group:{
        _id:"$author",
        total_likes:{$sum:"$likes"}
    }
})
```
