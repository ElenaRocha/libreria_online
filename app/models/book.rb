class Book < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :orders

  has_paper_trail
end
