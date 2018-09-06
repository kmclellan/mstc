class AddTitleToResources < ActiveRecord::Migration[5.2]
  def change
    add_column :resources, :title, :string
  end
end
