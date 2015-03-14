class Project < ActiveRecord::Base
  belongs_to :architect
  has_and_belongs_to_many :services

  validates :architect, :name, :details, :services, presence: true
  validates :name, uniqueness: true
  validates :image_url, format: {
    with: /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix,
    multiline: true,
    message: "enter a valid url, make sure it starts with 'http://'"}, if: :image_url?
end
