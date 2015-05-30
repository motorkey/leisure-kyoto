class EventPhoto < ActiveRecord::Base
  mount_uploader :image, EventPhotoUploader
end
