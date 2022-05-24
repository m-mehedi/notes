## Locale Time
```
let options = {
              timeZone: 'Asia/Dhaka',
              year: 'numeric',
              month: 'numeric',
              day: 'numeric',
              hour: 'numeric',
              minute: 'numeric',
              second: 'numeric'
            },
              myDate = new Intl.DateTimeFormat([], options);
              let bnTime = myDate.format(new Date());
```

## YYYYMMDD Format
```
Date.prototype.yyyymmdd = function() {
var mm = this.getMonth() + 1; // getMonth() is zero-based
var dd = this.getDate();

return [this.getFullYear(),
        (mm>9 ? '' : '0') + mm,
        (dd>9 ? '' : '0') + dd
        ].join('');
};

var date = new Date();
const TRANSDATE = date.yyyymmdd();
```

## Date in YYYY-MM-DD format
```
var dateOffset = (24*60*60*1000) * 1; 
var dateToday = new Date();
dateToday.setTime(dateToday.getTime() - dateOffset);
var yesterday = dateToday.toLocaleDateString('en-CA');
```