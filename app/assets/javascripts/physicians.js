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

// JavaScript Object Model
class Physician{
  constructor(obj){
    this.id = obj.id,
    this.name = obj.name,
    this.email = obj.email,
    this.specialty = obj.specialty,
    this.slug = obj.slug,
    this.appointments =obj.appointments;
  }
}



// After creating a instance of Object using JavaScript Object Model class, i can create a custom method on that instance using prototype
Physician.prototype.numOfAppointmentsHTML = function (){
  return (`
    <div>
     <fieldset>
       <h3>${this.name} has created ${this.appointments.length} appointments.</h3>
       <p>Email ${this.name} at ${this.email} if you have any questions or would like to schedule an appointment.</p>
      </fieldset>
    </div>
  `)
}
