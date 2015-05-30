class Event < ActiveRecord::Base
  has_many :event_days
  has_many :event_photos
  mount_uploader :avatar, AvatarUploader
end
