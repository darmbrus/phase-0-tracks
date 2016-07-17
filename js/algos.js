function testMatch(x,y) {
  for(var keyX in x) {
      if (x[keyX] == y[keyX]) { return true; }
  }
  return false;
}


one = {name: 54, age: 54};
two = {name: "54", age: 54};

if (testMatch(one, two)) {
  console.log("yes");
} else {
  console.log("no");
}
