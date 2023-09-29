class Genre < ApplicationRecord
    has_many_belongs_to_many :books
end
