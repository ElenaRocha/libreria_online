class Edition < ApplicationRecord
  belongs_to :book
  has_and_belongs_to_many :orders
end
