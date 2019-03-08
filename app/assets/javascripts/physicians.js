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
