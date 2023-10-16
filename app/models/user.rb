class User < ApplicationRecord
    has_many :orders

    validates :name, :email, :password, presence: true
    validates :email, uniqueness: true
end
