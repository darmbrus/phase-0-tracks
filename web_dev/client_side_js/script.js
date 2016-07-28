var title = document.getElementById("second-article");
console.log(title);

function underlineItem(event) {
  if (event.target.style.textDecoration == "underline") {
    event.target.style.textDecoration = "none";
  } else {
    event.target.style.textDecoration = "underline";
  }
}
addEventListener("click", underlineItem);
