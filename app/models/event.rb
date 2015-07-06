class Event < ActiveRecord::Base
  has_many :days, class_name: 'EventDay', dependent: :destroy
  has_many :photos, class_name: 'EventPhoto', dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  # ???
  accepts_nested_attributes_for :photos
end
