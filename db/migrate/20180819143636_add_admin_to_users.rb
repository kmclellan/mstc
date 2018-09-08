# frozen_string_literal: true

class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
   add_column :users, :administrator, :boolean, default: false
  end
end
