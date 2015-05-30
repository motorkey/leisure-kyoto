class Event < ActiveRecord::Base
  has_many :event_days
  has_many :event_photos
end
