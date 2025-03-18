class DeviseTokenAuthCreateMembers < ActiveRecord::Migration[8.0]
  def change
    change_table :members do |t|
      ## Required
      t.string :provider, null: false, default: "email"
      t.string :uid, null: false, default: ""

      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.boolean  :allow_password_change, default: false

      ## Rememberable
      t.datetime :remember_created_at

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Tokens
      t.json :tokens
    end

    add_index :members, :email,                unique: true
    add_index :members, [ :uid, :provider ],     unique: true
    add_index :members, :reset_password_token, unique: true
    add_index :members, :confirmation_token,   unique: true
  end
end
