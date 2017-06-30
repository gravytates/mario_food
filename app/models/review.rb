class Review < ApplicationRecord
  validates :author, :content_body, :rating, presence: true
  belongs_to :product
end
