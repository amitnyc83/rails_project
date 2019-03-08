 // Place all the behaviors and hooks related to the matching controller here.
 // All this logic will automatically be available in application.js.
 // You can use CoffeeScript in this file: http://coffeescript.org/

// document ready, listeners called
$(() => {
  console.log('physicians.js is loaded and its listening for a click now')
  listenForClick();
});



function listenForClick(){
  $('a.physician-data').on('click', function(e){
    e.preventDefault();
    getPhysicians();
  })
}


// function called from event listener : listenForClick()
function getPhysicians(){
  $.ajax({
    url: 'http://localhost:3000/physicians',
    method: 'GET',
    dataType: 'json'
  }).done(function(data){
     console.log("the data is: ", data);
      data.map(physician => {
        const newPhysician = new Physician(physician)
        const newPhysicianHTML = newPhysician.numOfAppointmentsHTML()
        document.getElementById("physician-appointments-html-area").innerHTML += newPhysicianHTML
      })
  })
}
