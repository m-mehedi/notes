## Currency Converter
```
function convert(num){
    let number;
    let num_size = num.toString().length;
    if(num_size >= 8){
        if((parseInt((num % 10000000) / 100000)) === 0){
            number = String(parseInt(num / 10000000)) + ' Crore '
        }
        else{
            number = String(parseInt(num / 10000000)) + ' Crore and ' + 
                     String(parseInt((num % 10000000) / 100000)) + ' Lakh'
        }
    }
    else if(num_size >= 6){
        if((parseInt((num % 100000) / 1000)) === 0)
            number = String(parseInt(num / 100000)) + ' Lakh '
        else{ number =  String(parseInt(num / 100000)) + ' Lakh ' + 
                        String(parseInt((num % 100000) / 1000)) + ' Thousand and '+
                        String(parseInt((num % 100000) % 1000)) 
        }
    }   
    else if(num_size >= 4){
        number = String(parseInt(num / 1000)) + ' Thousand and '+
                 String(parseInt(num % 1000))
    }
    else{
        number = num
    }
    return number
}
module.exports = { convert };
```