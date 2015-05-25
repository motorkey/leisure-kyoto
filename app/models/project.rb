class Project < ActiveRecord::Base
  has_many :dates, class_name: 'ProjectDate'
end
