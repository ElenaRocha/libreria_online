class Author < ApplicationRecord
  has_many :books


  def self.ransackable_attributes(auth_object = nil)
    ["name", "first_surname", "second_surname"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["books"]
  end
end
