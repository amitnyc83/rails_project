 // Place all the behaviors and hooks related to the matching controller here.
 // All this logic will automatically be available in application.js.
 // You can use CoffeeScript in this file: http://coffeescript.org/


 $(document).ready(function(){
   attachListeners()
  })

    function attachListeners(){
      $('#previousPhysician').on('click',() => previousPhysician());
      $('#nextPhysician').on('click',() => nextPhysician());
    };

    function previousPhysician(){
      $.get('/physicians', (allPhysician) => {
       if(allPhysician.data.length) {
         allPhysician.data.forEach(physician => {
           $('#physician').append(`<button id="physicianid-${physician.id}">Physician: ${physician.id}</button><br>`);
           $(`#physicianid-${physician.id}`).on('click', () => getPhysician(physician.id));
         })
       }
      })
    }


  class Physician {
    constructor(obj) {
     this.id  = obj.id
     this.name = obj.name
     this.slug = obj.slug
     this.email = obj.email
     this.specialty = obj.specialty
    }
  }
