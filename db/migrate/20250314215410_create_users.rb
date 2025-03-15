class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.datetime :last_signed_in
      t.datetime :access_expiry_date
      t.boolean :is_active

      t.timestamps
    end
  end
end
