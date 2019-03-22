# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Patient.create(name: "Mario", password: "password", email: "mario@mario.com", age: "30", date_of_birth: "1976-07-14")
Patient.create(name: "Sergio", password: "password", email: "sergio@sergio.com", age: "35", date_of_birth: "1983-07-12")
Patient.create(name: "Jamie", password: "password", email: "jamie@jamie.com", age: "40", date_of_birth: "1987-03-11")
Patient.create(name: "Test Patient 1 ", password: "password", email: "testpatient1@testpatient1.com", age: "72", date_of_birth: "1957-03-11")

Physician.create(name: "Dr.Patel", password: "password", email: "DrPatel@drpatel.com", specialty: "General Specialty")
Physician.create(name: "Dr.Timmy", password: "password", email: "DrTimmy@drTimmy.com", specialty: "Surgeon")
Physician.create(name: "Dr.Jimmy", password: "password", email: "DrJimmy@drjimmy.com", specialty: "Dentist")
Physician.create(name: "Physician 1", password: "password", email: "Physician1@physician1.com", specialty: "Neurologist")

Appointment.create(physician_id: 1, patient_id: 2, date: "2019-07-14", time: "4:30 PM")
Appointment.create(physician_id: 1, patient_id: 1, date: "2019-05-04", time: "1:30 PM")
Appointment.create(physician_id: 1, patient_id: 3, date: "2019-03-28", time: "12:30 PM")
Appointment.create(physician_id: 2, patient_id: 2, date: "2019-03-25", time: "4:30 PM")
Appointment.create(physician_id: 2, patient_id: 3, date: "2019-03-29", time: "4:30 PM")
Appointment.create(physician_id: 3, patient_id: 1, date: "2019-04-03", time: "4:30 PM")
Appointment.create(physician_id: 3, patient_id: 3, date: "2019-04-14", time: "4:30 PM")
Appointment.create(physician_id: 4, patient_id: 1, date: "2019-03-26", time: "4:30 PM")
Appointment.create(physician_id: 4, patient_id: 2, date: "2019-03-01", time: "4:30 PM")
Appointment.create(physician_id: 4, patient_id: 3, date: "2019-03-27", time: "4:30 PM")
Appointment.create(physician_id: 4, patient_id: 4, date: "2019-03-29", time: "4:30 PM")
