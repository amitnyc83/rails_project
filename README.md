# README

AppointmentMD is a Ruby on Rail with Javascript Flatiron Web Development project that allows Physicians and Patient to create and view appointments.
Includes:
 1) At least one has_many relationship(Physicians and Patients has many  appointments)

 2) At least one belongs_to relationship(Appointment belongs to Patient and Physician)

 3) Has many-to-many relationship(Physicians has many patients through appointments and patients can have many physicians also through appointments)

 4) The physician and patient models are validated with passwords and email addresses

 5) The Physician can sign in through a 3rd party service(Facebook in this case)

 6)Physicians are the only ones who can edit or create an appointment through nested routes



Installation Guide


To fork this folder go to https://github.com/amitnyc83/rails_project/blob/rails-w/-js-appointment-project/app/controllers/physicians_controller.rb (MAKE SURE TO SELECT THE RAILS-W/JS-APPOINTMENT-PROJECT BRANCH) After forking the project click clone/download and clicking on the clipboard to install in your terminal by typing "git clone" and paste the file you just copied.Type 'rake db:migrate' in your terminal to migrate your tables to the database and then 'rake db:seed' to fill the tables with information. Load all the gems to get the app working properly by typing "bundle install". Finally, type "rails server" int he terminal to start the app in the browser


Contributors guide

To file an issue with a pull request or report a bug,  navigate https://github.com/amitnyc83/rails_project/issues/new. All contributions are welcome.


License

This application is available as an open source under the terms of the MIT License.
