/*--------------------s3sivaram-----------------------------------------------  
   Values of variables declared within a function gets lost as soon as the function 
   execution gets over.
   
   Closure is a way of the storing the values of the variables declared within a function 
   to refer it even after its execution is over.
   
   By defining an inner function within a function , the values passed to the outer function
   always remains for the inner function to refer to.
    
--------------------------------------------------------------------------------*/

function outerFunc(outvar){
    
    function innerfunc(innervar){
        var innervar = innervar+outvar;
        return innervar; // returns only the address of the innerfunc & not the result
    }
return innerfunc;
}

// first time calling outerfunc will end up returning the address of the innerfunction
// and storing the outvar for future reference for innerfunc
var func1=outerFunc(1); 
// use the innerfunc signature to call it directly.
var func2= func1(2);
console.log(func2);
