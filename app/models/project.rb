class Project < ActiveRecord::Base
  has_many :project_date
  #validates :title, presence: true
end
