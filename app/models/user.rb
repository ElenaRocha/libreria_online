class User < ApplicationRecord

    has_many :orders, dependent: :destroy_async

    validates :name, :email, :password, presence: true
    validates :email, uniqueness: true
end
