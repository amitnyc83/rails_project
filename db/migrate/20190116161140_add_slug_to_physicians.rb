class AddSlugToPhysicians < ActiveRecord::Migration[5.2]
  def change
    add_column :physicians, :slug, :string
    add_index :physicians, :slug, unique: true
  end
end
