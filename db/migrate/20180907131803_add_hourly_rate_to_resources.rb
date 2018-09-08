class AddHourlyRateToResources < ActiveRecord::Migration[5.2]
  def change
    add_column :resources, :hourly_rate, :float
  end
end
