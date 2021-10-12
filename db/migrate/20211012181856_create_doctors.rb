class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.string :firstname
      t.string :lastname
      t.string :phone_number
      t.string :email
      t.string :speciality

      t.timestamps
    end
  end
end
