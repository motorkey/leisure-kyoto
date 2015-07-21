class AddSetOfUniquenessToReservations < ActiveRecord::Migration
  def change
    add_index :event_reservations, [:mail, :event_day_id], unique: true
  end
end
