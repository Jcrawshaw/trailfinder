class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.string :title
      t.text :body
      t.string :state
      t.references :user, index: true

      t.timestamps
    end
  end
end
