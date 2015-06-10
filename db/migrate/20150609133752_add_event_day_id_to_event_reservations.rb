class AddEventDayIdToEventReservations < ActiveRecord::Migration
  def change
    add_column :event_reservations, :event_day_id, :integer
  end
end
