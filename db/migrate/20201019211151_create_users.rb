class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :phone
      t.string :first_name
      t.string :last_name
      t.string :e_contact_name
      t.string :e_contact_email
      t.string :e_contact_phone

      t.timestamps
    end
  end
end
