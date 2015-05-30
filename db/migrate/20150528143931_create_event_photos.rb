class CreateEventPhotos < ActiveRecord::Migration
  def change
    create_table :event_photos do |t|
      t.belongs_to :event

      t.timestamps null: false
    end
  end
end
