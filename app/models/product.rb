class Product < ApplicationRecord
  has_many :reviews

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :price, numericality: true
  validates :name, uniqueness: true

  def price_in_dollars
    price_in_dollars = price.to_f / 100
    sprintf("$%.2f", price_in_dollars)
  end
end
