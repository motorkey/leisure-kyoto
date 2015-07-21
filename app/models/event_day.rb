class EventDay < ActiveRecord::Base
  belongs_to :event
  validates :event_id, presence: true
  has_many :reservations, class_name: 'EventReservation', dependent: :destroy
end
