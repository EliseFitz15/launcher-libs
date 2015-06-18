class Story < ActiveRecord::Base
  validates :name, presence: true

  has_many :catalogs
end
