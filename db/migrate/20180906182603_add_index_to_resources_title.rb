class AddIndexToResourcesTitle < ActiveRecord::Migration[5.2]
  def change
    add_index :resources, :title, unique: true
  end
end
