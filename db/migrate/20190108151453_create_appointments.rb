class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.integer :physician_id
      t.integer :patient_id
      t.date :date
      t.time :time
      t.index ["physician_id"], name: "index_appointments_on_physician_id"
      t.index ["patient_id"], name: "index_appointments_on_patient_id"
      t.timestamps
    end
  end
end
