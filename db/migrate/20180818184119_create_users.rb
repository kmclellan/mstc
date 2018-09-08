# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email

      t.timestamps
    end

    create_table :admins do |t|
      t.references :user, index: { unique: true }, foreign_key: true
      t.string :position

      t.timestamps
    end

  end
end
