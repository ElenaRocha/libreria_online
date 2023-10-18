class Genre < ApplicationRecord
    has_and_belongs_to_many :books

    accepts_nested_attributes_for :books

    validates :definition, presence: true
    validates :definition, uniqueness: true

end
