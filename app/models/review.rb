class Review < ApplicationRecord
  validates :author, :content_body, :rating, presence: true
  validates :content_body, length: { in: 10..250 }
  validates :rating, numericality: { greater_than: 0, less_than: 6 }

  belongs_to :product
end
