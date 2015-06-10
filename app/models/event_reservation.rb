class EventReservation < ActiveRecord::Base
  belongs_to :event_day
end
