// Create two arrays

var colors = ["red", "green", "blue", "purple"];

var names = ["James", "Lary", "Matilda", "Sue"];


colors.push("orange");

names.push("Gavin");
// names.push("Steve");
console.log(colors);
console.log(names);

horses = {};
if (names.length == colors.length) {
  for(var i = 0; i < names.length; i++) {
    horses[names[i]] = colors[i];
  }
}
console.log(horses);


function Car(color, year, model) {
  this.color = color;
  this.year = year;
  this.model = model;

  this.drive = function() { console.log('VROOOOM'); }

}


console.log("Creating new car: ")
var car1 = new Car("blue", 1974, "geo metro");

car1.drive();

var car2 = new Car("red", 2010, "Camaro");

console.log("You just won a " + car2.color + " " + car2.year
            + " " + car2.model + ".");
