class AddImagesToTrails < ActiveRecord::Migration
  def change
    add_column :trails, :images, :string
  end
end
