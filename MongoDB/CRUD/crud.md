### Load Mongo Commands from JavaScripts
- `use classInfo'
- create a js file named students.js
```
db.studentInfo.insert(
{
    name:{firstName:"John", lastName:"Doe"},
    class:6,
    rollNo: 23,
    subjects:["Maths","Physics","English","Chemistry"],
    attendance: {
    January: "90%",
    February:"85%",
    March:"98%"
    }
}
);
db.studentInfo.insert(
{
    name:{firstName:"Sunil", lastName:"Gupta"},
    rollNo: 24,
    subjects:["Maths","Physics","English","Chemistry"],
    attendance: {
    January: "97%%",
    February:"99%",
    March:"100%"
    }
}
);
db.studentInfo.insert(
{
    name:{firstName:"Jonny", lastName:"Jon"},
    rollNo: 27,
    subjects:["Maths","Physics","English","Chemistry"],
    attendance: {
    January: "87%%",
    February:"99%",
    March:"100%"
    }
}
);
```
- `load("c:/mongo/students.js)`
- `db.studentInfo.find().pretty()`

### Inserting array into collection
- create a js file using array
```
var studentsInfoArray = [
  {
    name: { firstName: "Sunil", lastName: "Gupta" },
    age: 16,
    subjects: ["Maths", "Physics", "Chemistry"],
    attendance: {
      Jan: "100%",
      Feb: "99%",
      Mar: "100%",
    },
  },
  {
    name: { firstName: "Sunil", lastName: "Gupta" },
    age: 16,
    subjects: ["Maths", "Physics", "Chemistry"],
    attendance: {
      Jan: "100%",
      Feb: "99%",
      Mar: "100%",
    },
  },
  {
    name: { firstName: "Alun", lastName: "Hill" },
    age: 12,
    subjects: ["Small Business", "Medium Business", "Journalist"],
    attendance: {
      Jan: "100%",
      Feb: "100%%",
      Mar: "100%",
    },
  },
];
db.studentsInfoCollection.insertMany(studentsInfoArray);

```
- `load("c:/mongo/studentsArray);`
- `show collections`
-  `db.studentsInfoCollection.find().pretty()`

#### Updating Documents
- `db.studentsInfoCollection.update({"name.firstName":"Sunil"},{$set:{"age":17}})`
- `db.studentsInfoCollection.update({"name.firstName":"Sameer"},{$set:{"age":17}}, {upsert: true})`
- `db.studentsInfoCollection.update({"name.firstName":"Sunil"},{$set:{"subjects.1":"Science"}})`

#### Deleting Documents
- `db.studentsInfoCollection.remove({"name.firstName":"Sunil"})`
- `db.studentsInfoCollection.remove({"subjects":"Maths"})`
- `db.studentsInfoCollection.remove({"subjects":"Maths"},1)`
- `db.studentsInfoCollection.remove()`
