class Project < ActiveRecord::Base

  before_validation :set_slug

  belongs_to :architect
  has_and_belongs_to_many :services

  has_attachment :photo, accept: [:jpg, :png]

  validates :architect, :name, :slug, :details, :services, :photo, presence: true
  validates :name, :slug, uniqueness: true

  scope :next, lambda {|id| where("id > ?",id).order("id ASC") } # this is the default ordering for AR
  scope :previous, lambda {|id| where("id < ?",id).order("id DESC") }

  def next
    project = Project.next(self.id).first
  end

  def previous
    project = Project.previous(self.id).first
  end

  def to_param
    self.slug
  end

  def set_slug
    self.slug = generate_slug
  end

  def generate_slug
    return nil unless self.name
    return candidate = self.name.downcase.gsub(/[^a-z0-9]+/, '-')
  end

end
