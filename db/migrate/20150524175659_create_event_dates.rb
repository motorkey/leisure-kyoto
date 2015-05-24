class CreateEventDates < ActiveRecord::Migration
  def change
    create_table :event_dates do |t|
      t.string :date
      t.references :projecr, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
