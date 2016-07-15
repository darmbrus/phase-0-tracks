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


