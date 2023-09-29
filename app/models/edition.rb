class Edition < ApplicationRecord
  belongs_to :book
  has_many_belongs_to_many :orders
end
