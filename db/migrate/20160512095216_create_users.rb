class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :mobile
      t.boolean :admin
      t.string :password_hash
      t.string :password_salt
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
