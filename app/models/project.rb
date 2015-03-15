class Project < ActiveRecord::Base

  before_validation :set_slug, unless: :slug
  before_save :set_slug, if: :slug

  belongs_to :architect
  has_and_belongs_to_many :services

  has_attachment :photo, accept: [:jpg, :png]

  validates :architect, :name, :slug, :details, :services, :photo, presence: true
  validates :name, :slug, uniqueness: true

  def to_param
    self.slug
  end

  def set_slug
    self.slug = generate_slug
  end

  def generate_slug(n=1)
    return nil unless self.name
    candidate = self.name.downcase.gsub(/[^a-z0-9]+/, '-')
    candidate += "-#{n}" if n > 1
    return candidate unless Project.find_by_slug(candidate)
    generate_slug(n+1)
  end

end
