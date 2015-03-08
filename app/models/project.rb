class Project < ActiveRecord::Base
  belongs_to :architect
  has_and_belongs_to_many :services
end
