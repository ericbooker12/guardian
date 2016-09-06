$(document).ready(function(){

  // var turbolinks = require('turbolinks')

  $("#walk-me-home").on("click", function(e){
    e.preventDefault();

    $.ajax({
      url: "/sms/text_friend"
    })
    .done(function(serverResponse){
     
      console.log(serverResponse + " This is the server response");
    })

    .fail(function(serverResponse){
     
      console.log("Request failed");
    })
  
    $.ajax({
      url: "http://172.16.50.232:8080/start",
      crossDomain : true,
    })
    .done(function(serverResponse){
      $("#walk-me-home").hide();
      $("#home-safely").show();
      console.log(serverResponse + "This is the server response");
    })
  // need to add failure response
  })

  $("#home-safely").on("click", function(e){
    console.log("I'm home!!")
    e.preventDefault();
    $.ajax({
      url: "http://172.16.50.232:8080/end",
      crossDomain : true,
    })
    .done(function(serverResponse){
      $("#home-safely").hide();
      $("#show-events").show();
      console.log(serverResponse + "This is the server response");
    
    })
  })

});
