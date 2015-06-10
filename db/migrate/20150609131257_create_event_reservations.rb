class CreateEventReservations < ActiveRecord::Migration
  def change
    create_table :event_reservations do |t|
      t.string :name
      t.integer :number
      t.string :mail

      t.timestamps null: false
    end
  end
end
