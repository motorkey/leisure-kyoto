class CreateEventDays < ActiveRecord::Migration
  def change
    create_table :event_days do |t|
      t.date :event_on
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
