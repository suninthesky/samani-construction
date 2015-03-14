class Project < ActiveRecord::Base
  belongs_to :architect
  has_and_belongs_to_many :services

  has_attachment :photo, accept: [:jpg, :png]

  validates :architect, :name, :details, :services, :photo, presence: true
  validates :name, uniqueness: true
end
