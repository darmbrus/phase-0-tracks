$(document).ready(function() {
  $("#button1").click(function() {
    $("p").hide();
  });
  $("#button2").click(function() {
    $("p").show();
  });
  $("#background_button").click(function() {
    $("p").css("background-color", "black");
  });
});
