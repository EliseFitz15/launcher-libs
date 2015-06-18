class Catalog < ActiveRecord::Base
  validates :content, presence: true

  belongs_to :story
end
