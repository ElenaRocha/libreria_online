class Book < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :orders
  # has_many :books_orders
  # has_many :orders, through: :books_orders

  accepts_nested_attributes_for :genres

  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :title, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ["title", "synopsis"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["author"]
  end

  #active record callback
  before_validation do
    @author = Author.find_or_create_by(name: author_id)
    puts "el nombre que estoy buscando #{author_id}"
    puts "¿me encuentra al autor? #{@author.id}"
    # no recnoce strings
    # no se materializa el insert de un autor nuevo
  end

end
