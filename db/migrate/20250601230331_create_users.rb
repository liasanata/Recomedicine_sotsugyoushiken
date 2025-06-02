class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name, limit: 30, null: false
      t.string :email, limit: 50, null: false
      t.string :password_digest, null: false
      t.integer :role, null: false, default: 0


      t.timestamps
    end
  end
end