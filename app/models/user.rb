class User < ApplicationRecord

    has_secure_password

    has_many :orders, dependent: :destroy_async

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: {with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/}
    validates :password, presence: true, format: {with: /\A(?=.*[a-zA-Z])(?=.*[0-9]).{6,}\z/}
end
