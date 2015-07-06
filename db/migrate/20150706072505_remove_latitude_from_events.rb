class RemoveLatitudeFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :latitude, :float
  end
end
