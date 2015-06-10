class Event < ActiveRecord::Base
  has_many :days, class_name: 'EventDay', dependent: :destroy
  has_many :photos, class_name: 'EventPhoto', dependent: :destroy
  # ???
  accepts_nested_attributes_for :photos

  # Google Map
  geocoded_by :address
  after_validation :geocode
end
