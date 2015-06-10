class EventDay < ActiveRecord::Base
  belongs_to :event
  has_many :reservations, class_name: 'EventReservation', dependent: :destroy
end
