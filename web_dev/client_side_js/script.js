function underlineItem(event) {
  if (event.target.style.textDecoration == "underline") {
    event.target.style.textDecoration = "none";
  } else {
    event.target.style.textDecoration = "underline";
  }
}
addEventListener("click", underlineItem);
function makeParagraph() {
  var button = document.createElement("P");
  var t = document.createTextNode("This is a paragraph");
  button.appendChild(t);
  document.body.appendChild(button);
  console.log("paragraph created");
}

