class Product < ApplicationRecord
  validates :name, :country_origin, :image, presence: true
  has_many :reviews, dependent: :destroy

  scope :alphabetical, -> { order(name: :asc) }
  scope :creation, -> { order(created_at: :desc) }

  scope :most_reviews, -> {(
    select('products.*, count(reviews.id) as reviews_count')
    .joins(:reviews)
    .group("products.id")
    .order('reviews_count DESC')
    )}


  def average_rating
    average = 0
    total = 0
    if self.reviews != 0 && self.reviews.ratings.length != 0
      self.reviews.ratings.each do |rating|
        total += rating
      end
      average = total / self.reviews.ratings.length
    end
    average
  end
end
