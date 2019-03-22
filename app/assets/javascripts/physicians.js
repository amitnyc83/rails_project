 // Place all the behaviors and hooks related to the matching controller here.
 // All this logic will automatically be available in application.js.
 // You can use CoffeeScript in this file: http://coffeescript.org/

// document ready, listeners called
$(() => {
  console.log('physicians.js is loaded and its listening for a click now')
  listenForClick();
  listenForNewAppointmentFormClick();
  listenForSubmitAppointmentFormClick();
  loadAppointmentsClick();
});




// this render appointment Index page via JS & JSON backend and uses a prototype method. Uses ES6 Arrow Functions
const loadAppointmentsClick = () => {
 $('a.load-appointments').on('click', function(e){
    e.preventDefault();
    $("div#appointments").html('');
   //Requesting HTML
   // $.get(this.href).done(function(response){
   //   $("div.appointments").html(response)
   //  })

   //Requesting JSON Object
   $.get(this.href).done(function(json){
     json.forEach(function(appointment){
       let newAppointment = new Appointment(appointment)
       let appointmentHtml = newAppointment.getAppointmentInfo()
       document.getElementById("appointments").innerHTML += appointmentHtml
      })
    })
  })
}



// translate JSON response into JS Model Object & has a prototype method. Uses ES6 Arrow functions
class Appointment{
  constructor(appointment){
   this.id = appointment.id,
   this.date = appointment.date,
   this.time = appointment.time,
   this.physicianId = appointment.physician.id,
   this.physicianName = appointment.physician.name,
   this.physicianSlug = appointment.physician.slug,
   this.patientId = appointment.patient.id,
   this.patientName = appointment.patient.name,
   this.patientSlug = appointment.patient.slug
  }
}

Appointment.prototype.getAppointmentInfo = function() {
  return `
  <div>
   <table>
     <tr>
       <th>Appointment Date</th>
       <td>${this.date}</td>
     </tr>
     <tr>
       <th>Appointment Time</th>
      <td>${this.time}</td>
     </tr>
     <tr>
       <th>Patient</th>
       <td><a href="/patients/${this.patientSlug}">${this.patientName}</a></td>
     </tr>
   </table>
   <a href="/appointments/${this.id}">View Full Details of Appointment</a>
  </div>`
}


// translates JSON responses into JS Model Object & uses a prototype method. using ES6 Arrow functions
const listenForClick = () => {
  $('.js-physician-data').on('click', function(e){
    e.preventDefault();
    let id = $(this).attr("data-id");
    fetch(`/physicians/${id}.json`)
    .then((response) => response.json())
    .then(physician => {
      $(`physician-appointments-html-area-${physician.id}`).html('')
      let newPhysician = new Physician(physician)
      let physicianHtml = newPhysician.numOfAppointmentsHTML()
      document.getElementById(`physician-appointments-html-area-${physician.id}`).innerHTML += physicianHtml
      console.log(newPhysician)
    });
  });
}




// Use of ES6 Constructor Function
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

Physician.prototype.physicianHtml = function(element){
  $(element).append(`
    <div class='physician'>
     <table>
        <tr>
         <th>Name</th>
         <td>${this.name}</td>
        </tr>
        <tr>
         <th>Specialty</th>
         <td>${this.specialty}</td>
        </tr>
      </table>
    </div>
  `)
}

Physician.newAppointmentForm = function() {
  return (`
   <strong>New Appointment Form</strong>
    <form id="appointment-form" method='post' action="">
     Date: <input id='appointmentDate' type='date' name='appointment[date]'></input><br>
     Time: <input id='appointmentTime' type='time' name='appointment[time]'></input><br>
     Physician Name: <input id='appointmentPhysician' type='text' name='physician[name]'></input><br>
     Patient Name: <input id='appointmentPatient' type='text' name='patient[name]'></input><br>
     <input type='button' value='Submit Appointment' class="submit-appointment-form"/>
    </form>

    <div id='AppointmentData'>
     <p id='appointmentPhysician'</p>
     <p id='appointmentPatient'</p>
     <p id='appointmentDate'</p>
     <p id='appointmentTime'</p>
    </div>
 `)
}

const listenForNewAppointmentFormClick = () => {
  $('a.create-new-appointment-form').on('click', function(e){
    e.preventDefault();
    let newAppointmentForm = Physician.newAppointmentForm();
    document.querySelector('div#new-appointment-form').innerHTML = newAppointmentForm
  });
}

const listenForSubmitAppointmentFormClick = () => {
  $('a.submit-appointment-form').on('submit', function(e){
    e.preventDefault();
    let $form = $(this);
    let url = "/appointments"
    let formData = $(this).serialize();
    let posting = $.post(url, formData, function(response){
    }).success($('a.create-new-appointment-form').reset()).then(getAppointmentInfo());

  })
}






// function listenForPhysicianData(){
//   $(function(){
//     $(".js-physician-data").on('click', function(e){
//       let id = $(this).data("id");
//       $.ajax({
//         url: `http://localhost:3000/physicians/${id}.json`,
//         method: 'GET',
//         dataType: 'json',
//         success: function(data){
//            $(`physician-appointments-html-area-${physician.id}`).html('')
//             let newPhysician = new Physician(physician)
//             let newPhysicianHtml = newPhysician.numOfAppointmentsHTML()
//             document.getElementById(`physician-appointments-html-area-${physician.id}`).innerHTML = newPhysicianHtml
//           }
//         }
//       })
//     })
//   })
// }



//class="new_appointment" id="new_appointment" action="/appointments" accept-charset="UTF-8" method="post"

// const listenForNewAppointmentFormClick =  () => {
//   $('.create-new-appointment-form').on('click',function(e){
//     e.preventDefault();
//     let url = this.action;
//     let formData = $(this).serialize();
//     let postAppointment = $.post(url, formData)
//     postAppointment.done(function(data){
//       console.log(data)
//     });
//     let newAppointmentForm = Physician.newAppointmentForm()
//     document.querySelector('div#new-appointment-form').innerHTML = newAppointmentForm
//   });
// }




// const newAppointmentFormClick = () => {
//   $('.create-new-appointment-form').on('submit', function(e){
//     $.ajax({
//      type: ($('input[name="_method"]').val() || this.method),
//      url: this.action,
//      data: $(this).serialize(),
//      success: function(response){
//
//       }
//     });
//    e.preventDefault();
//  })
// }


// JavaScript Object Model using constructor function and static form

//   static newAppointmentForm(){
    // return (`
    //   <strong>New Appointment Form</strong>
    //   <form>
    //   Date: <input id='appointmentDate' type='date' name='appointment[date]' id='appointmentdate'></input><br>
    //   Time: <input id='appointmentTime' type='time' name='appointment[time]' id='appointmentTime' ></input><br>
    //   Physician Name: <input id='appointmentPhysician' type='text' name='physician[name]'id='appointmentPhysician'></input><br>
    //   Patient Name: <input id='appointmentPatient' type='text' name='patient[name]' id='appointmentPatient'></input><br>
    //   <input type='submit'/>
    //   </form>
    //
    //   <div id="newAppointment">
    //   <p id="appointmentDate"></p>
    //   <p id="appointmentTime"></p>
    //   <p id="appointmentPhysician"></p>
    //   <p id="appointmentPatient"></p>
    //   </div>
    // `)
//   }
// }



// JS Model Object
// function Physician(physician){
//   this.id = physician.id,
//   this.name = physician.name,
//   this.email = physician.email,
//   this.specialty = physician.specialty,
//   this.slug = physician.slug,
//   this.appointments =physician.appointments;
// }




// const newAppointmentForm = function(){
//   return (`
//       <strong>New Appointment Form</strong>
//       <form>
//        <input id='appointment-date' type='date' name='appointment[date]'</input><br>
//        <input id='appointment-time' type='time' name='appointment[time]'</input><br>
//        <input id='appointment_physician_id' type='text' select name='appointment[physician_id]' id='appointment_physician_id'</input><br>
//        <input id='appointment_patient_id' type='text' select_name='appointment[pateint_id]' id='appointment_pateint_id'</input><br>
//        <input type='submit'/>
//       </form>
//     `)
// }




// Physician.prototype.newAppointmentForm = function() {
//   return (`
//     <strong>New Appointment Form</strong>
//     <form>
//      <input id='appointment-date' type='date' name='appointment[date]'</input><br>
//      <input id='appointment-time' type='time' name='appointment[time]'</input><br>
//      <input id='appointment_physician_id' type='text' select name='appointment[physician_id]' id='appointment_physician_id'</input><br>
//      <input id='appointment_patient_id' type='text' select_name='appointment[pateint_id]' id='appointment_pateint_id'</input><br>
//      <input type='submit'/>
//     </form>
//   `)
// }




// function listenForClick(){
//   $('.js-physician-data').on('click', function(e){
//     e.preventDefault();
//     getPhysiciansData();
//   })
// }

// this is the ES5 way





// low level ajax function for rendering appointment index page via JS & JSON backend
// const loadAppointmentClick = () => {
//  $('a.load-appointments').on('click', function(e){
//    $.ajax({
//      method: "GET",
//      url: this.href,
//    }).success(function(response){
//      $("div.appointments").html(response)
//    }).error(function(){
//      alert("Your Appointments could not be loaded")
//    })
//    e.preventDefault();
//   });
// }




// After creating a instance of Object using JavaScript Object Model class, i can create a custom method on that instance using prototype
// Just a different way of doing the above with a return instaed of a variable
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
