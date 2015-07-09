class AddEventIdToEventReservation < ActiveRecord::Migration
  def change
    add_column :event_reservations, :event_id, :integer
  end
end
