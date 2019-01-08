class CreatePhysicians < ActiveRecord::Migration[5.2]
  def change
    create_table :physicians do |t|
      t.string :name
      t.text :email
      t.text :password_digest
      t.text :specialty

      t.timestamps
    end
  end
end
