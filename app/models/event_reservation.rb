class EventReservation < ActiveRecord::Base
  belongs_to :event_day
  validates :event_day_id, presence: true
  has_one :event, through: :event_day
  validates :event_id, presence: true
  before_save { self.mail = mail.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  #
  # numberは残りの参加人図で上限を決めること！
  #
  validates :number, presence: true, numericality: { only_integer: true, greater_than: 0 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :mail, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { scope: [:event_day_id] }
end
