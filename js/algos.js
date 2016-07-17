// Write a function that will return the longest 
// element from an array.
function longest(array) {
  if(array.length > 0) {
    var testWord = array[0];
    for(var i = 1; i < array.length; i++) {
      if(testWord.length < array[i].length){
        testWord = array[i];
      }
    }
    return(testWord);
  }
}

var testArray = ["long", "longer", "longest"];
console.log(longest(testArray));
testArray = ["12345", "123456", "1234"];
console.log(longest(testArray));

// Write a function that takes two objects
// and check to see if they share a key 
// value pair.
function testMatch(x,y) {
  for(var keyX in x) {
      if (x[keyX] == y[keyX]) { return true; }
  }
  return false;
}


var one = {name: "John", age: 54};
var two = {name: "Peter", age: 54};

if (testMatch(one, two)) {
  console.log("yes");
} else {
  console.log("no");
}
one = {name: "John", age: 54};
two = {name: "Peter", age: 53};

if (testMatch(one, two)) {
  console.log("yes");
} else {
  console.log("no");
}
