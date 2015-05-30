class AddImageToEventPhotos < ActiveRecord::Migration
  def change
    add_column :event_photos, :image, :string
  end
end
