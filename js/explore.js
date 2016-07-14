/*
 * Reverse psuedocode:
 *  find the length of the string
 *  set a counter to the length of the string
 *  until the counter reaches zero
 *  find the character at that spot and add it to a new reverse string
 *  return the string
 */

function reverse(string) {
  var reversed = '';

  for (var i = string.length; i > 0; i--) {
    reversed += string[i-1];
  }
  return reversed;
}

if(true) {
  console.log(reverse('this is a long word'));
}
