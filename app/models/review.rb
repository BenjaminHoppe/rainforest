class Review < ApplicationRecord
  belongs_to :products
  validates :body, presence: true
end
