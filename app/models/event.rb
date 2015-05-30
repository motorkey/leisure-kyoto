class Event < ActiveRecord::Base
  has_many :days, class_name: 'EventDay'
  has_many :photos, class_name: 'EventPhoto'
end
