class EventReservation < ActiveRecord::Base
  belongs_to :event_day
  before_save { self.mail = mail.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail, presence: true, format: { with: VALID_EMAIL_REGEX }
  validate :set_of_mail_and_event_day_id_is_unique
  def set_of_mail_and_event_day_id_is_unique
    if EventReservation.exists? ['mail = ? AND event_day_id = ?', mail, event_day_id.to_i]
      errors.add("You've already reserved the event on the date")
    end
  end
end
