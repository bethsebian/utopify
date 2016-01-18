class Travesty < ActiveRecord::Base
  before_save :generate_slug
  has_many :items
  validates :title, presence: true, uniqueness: true

  def to_param
    title.parameterize
  end

  def self.find(input)
    if input.to_i != 0
      super
    else
      find_by_title(input)
    end
  end

  def generate_slug
    self.slug = title.parameterize
  end
end
