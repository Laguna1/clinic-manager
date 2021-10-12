class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :firstname
      t.string :lastname
      t.string :phone_number
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
