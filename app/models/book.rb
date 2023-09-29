class Book < ApplicationRecord
  belongs_to :author
  has_many_belongs_to_many :genre
  has_many :editions
end
