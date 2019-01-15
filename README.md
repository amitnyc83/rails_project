# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

AppointmentMD is a Ruby on Rails Flatiron Web Development project that allows Physicians and Patient to create and view appointments.
Includes:
 1) At least one has_many relationship(Physicians and Patients has many  appointments)

 2) At least one belongs_to relationship(Appointment belongs to Patient and Physician)

 3) Has many-to-many relationship(Physicians has many patients through appointments and patients can have many physicians also through appointments)

 4) The physician and patient models are validated with passwords and email addresses

 5) The Physician can sign in through a 3rd party service(Facebook in this case)

 6)Physicians are the only ones who can edit or create an appointment through nested routes
