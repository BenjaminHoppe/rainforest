class Product < ApplicationRecord
  has_many :reviews
  validates :name, :price, :description, presence: true
  validates :price, numericality: true
  validates :name, uniqueness: true
end
