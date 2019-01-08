class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :age
      t.text :email
      t.text :password_digest
      t.date :date_of_birth

      t.timestamps
    end
  end
end
