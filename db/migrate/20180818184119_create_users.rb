# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :usertypes do |t|
      t.text :user_type
    end

    create_table :users do |t|
      t.belongs_to :usertype, foreign_key: true
      t.string :firstname
      t.string :lastname
      t.string :email

      t.timestamps
    end
  end
end
