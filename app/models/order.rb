class Order < ApplicationRecord
  belongs_to :user
  has_many_belongs_to_many :editions
end
