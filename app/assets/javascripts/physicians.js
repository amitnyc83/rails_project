 // Place all the behaviors and hooks related to the matching controller here.
 // All this logic will automatically be available in application.js.
 // You can use CoffeeScript in this file: http://coffeescript.org/


 $(document).ready(function(){
   attachListeners()
   })


class Physician {
  constructor(obj) {
    this.id  = obj.id
    this.name = obj.name
    this.slug = obj.slug
    this.email = obj.email
    this.specialty = obj.specialty
  }
}
