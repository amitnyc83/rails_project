 // Place all the behaviors and hooks related to the matching controller here.
 // All this logic will automatically be available in application.js.
 // You can use CoffeeScript in this file: http://coffeescript.org/

// document ready, listeners called
$(() => {
  console.log('physicians.js is loaded and its listening for a click now')
  listenForClick();
  listenForNewAppointmentFormClick();
  // listenForPhysicianData();
});

// function listenForPhysicianData(){
//   $(function(){
//     $(".js-physician-data").on('click', function(){
//       let id = $(this).data("id");
//       $.ajax({
//         url: 'http://localhost:3000/physicians',
//         method: 'GET',
//         dataType: 'json',
//         success: function(data){
//           console.log("the data is: ", data)
//           data.forEach(physician)
//           if(physician.id == id){
//             const newPhysician = new Physician(physician)
//             const newPhysicianHtml = newPhysician.numOfAppointmentsHTML()
//             document.getElementById("physician-appointments-html-area").innerHTML += newPhysicianHtml
//           }
//         }
//       })
//     })
//   })
// }



// function listenForClick(){
//   $('a.physician-data').on('click', function(e){
//     e.preventDefault();
//     getPhysiciansData();
//   })
// }

const listenForClick = () => {
  $('.js-physician-data').on('click', function(e){
    e.preventDefault();
    let id = $(this).attr("data-id");
    fetch(`/physicians/${id}.json`)
    .then((response) => response.json())
    .then(physician => {
      $("physician-appointments-html-area").html('')
      let newPhysician = new Physician(physician)
      let physicianHtml = newPhysician.numOfAppointmentsHTML()
      document.getElementById("physician-appointments-html-area").innerHTML = physicianHtml
      console.log(newPhysician)
    });
  });
}

// function getPhysiciansData(){
//   $.ajax({
//     url: 'http://localhost:3000/physicians',
//     method: 'GET',
//     dataType: 'json',
//     success: function (data) {
//      console.log("the data is: ", data)
//      data.forEach(physician => {
//        const newPhysician = new Physician(physician)
//        const newPhysicianHTML = newPhysician.numOfAppointmentsHTML()
//        document.getElementById("physician-appointments-html-area").innerHTML += newPhysicianHTML
//       })
//     }
//   })
// }

function listenForNewAppointmentFormClick(){
  $('a.new-appointment-form').on('click', function(e){
    e.preventDefault();
    let newAppointmentForm = Physician.newAppointmentForm();
    document.querySelector('div#new-appointment-form').innerHTML = newAppointmentForm
  })
}

function Physician(physician){
  this.id = physician.id,
  this.name = physician.name,
  this.email = physician.email,
  this.specialty = physician.specialty,
  this.slug = physician.slug,
  this.appointments =physician.appointments;
}

Physician.prototype.numOfAppointmentsHTML = function(){
  let physicianHtml = `
    <div>
     <fieldset>
       <h3>${this.name} has created ${this.appointments.length} appointments.</h3>
       <p>Email ${this.name} at ${this.email} if you have any questions or would like to schedule an appointment.</p>
      </fieldset>
    </div>
  `
  return physicianHtml
}



//
// function listenForNewAppointmentFormClick(){
//   $('a.new-appointment-form').on('click', function(e){
//     e.preventDefault();
//     $.ajax({
//       url: 'https://localhost:3000/appointments/new',
//       method: 'get',
//       dataType: 'html'
//     }).done(function(response){
//       $('div#new-appointment-form').html(response);
//     })
//   })
// }






// JavaScript Object Model
// class Physician{
//   constructor(obj){
//     this.id = obj.id,
//     this.name = obj.name,
//     this.email = obj.email,
//     this.specialty = obj.specialty,
//     this.slug = obj.slug,
//     this.appointments =obj.appointments;
//   }
//   static newAppointmentForm(){
//     return (`
//       <strong>New Appointment Form</strong>
//       <form>
//       Date: <input id='appointmentDate' type='date' name='date'></input><br>
//       Time: <input id='appointmentTime' type='time' name='time'></input><br>
//       Physician Name: <input id='appointmentPhysician' type='text' name='physician[name]' ></input><br>
//       Patient Name: <input id='appointmentPatient' type='text' name='patient[name]'></input><br>
//       <input type='submit'/>
//       </form>
//
//       <div id="newAppointment">
//       <p id="appointmentDate"></p>
//       <p id="appointmentTime"></p>
//       <p id="appointmentPhysician"></p>
//       <p id="appointmentPatient"></p>
//       </div>
//     `)
//   }
// }


// After creating a instance of Object using JavaScript Object Model class, i can create a custom method on that instance using prototype
// Physician.prototype.numOfAppointmentsHTML = function (){
//   return (`
//     <div>
//      <fieldset>
//        <h3>${this.name} has created ${this.appointments.length} appointments.</h3>
//        <p>Email ${this.name} at ${this.email} if you have any questions or would like to schedule an appointment.</p>
//       </fieldset>
//     </div>
//   `)
// }

$(function(){
  $('form').submit(function(event){
    event.preventDefault();
    var values = $(this).serialize();
    var posting = $.post(`/physicians/${physician.slug}`, values);
    posting.done(function(data){
      var appointment = data;
      $("#appointmentDate").text(appointment["date"]);
      $("#appointmentTime").text(appointment["time"]);
      $("#appointmentPhysician").text(appointment["physician"]["name"]);
      $("#appointmentPatient").text(appointment["patient"]["name"]);
    });
  });
});
