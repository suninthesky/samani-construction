class Architect < ActiveRecord::Base
  has_many :projects

  validates :name, presence: true, uniqueness: true
  validates :website, format: {
    with: /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix,
    multiline: true,
    message: "enter a website address, make sure it starts with 'http://'"}, if: :website?
end
