class AddLongitudeToEvent < ActiveRecord::Migration
  def change
    add_column :events, :longitude, :float
  end
end
