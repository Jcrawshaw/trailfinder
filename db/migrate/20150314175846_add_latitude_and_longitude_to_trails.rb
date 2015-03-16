class AddLatitudeAndLongitudeToTrails < ActiveRecord::Migration
  def change
    add_column :trails, :latitude, :float
    add_column :trails, :longitude, :float
  end
end
