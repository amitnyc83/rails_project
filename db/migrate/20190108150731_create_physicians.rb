class CreatePhysicians < ActiveRecord::Migration[5.2]
  def change
    create_table :physicians do |t|
      t.string :name
      t.string :email
      t.string :image
      t.string :uid
      t.string :password_digest
      t.string :specialty

      t.timestamps
    end
  end
end
