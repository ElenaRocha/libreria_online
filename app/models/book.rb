class Book < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :orders

  mount_uploader :image, ImageUploader

  def self.ransackable_attributes(auth_object = nil)
    ["title", "synopsis"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["author"]
  end
end
