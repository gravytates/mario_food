class Product < ApplicationRecord
  validates :name, :country_origin, :image, :cost, presence: true
  validates :cost, numericality: true
  has_many :reviews, dependent: :destroy
  before_save(:titlecase)
  before_save(:upcase)

  scope :recent_creations, -> { order(created_at: :desc).limit(3) }
  scope :recent, -> { order(created_at: :desc) }  
  scope :alphabetical, -> { order(name: :asc) }
  scope :high_price, -> { order(cost: :desc) }
  scope :low_price, -> { order(cost: :asc) }



  scope :most_reviews, -> {(
    select('products.*, count(reviews.id) as reviews_count')
    .joins(:reviews)
    .group("products.id")
    .order('reviews_count DESC')
    .limit(1)
    )}

  scope :usa, -> { where(country_origin: "USA")}

  def average_rating
    average = 0
    total = 0
    if self.reviews.length != 0
      self.reviews.each { |review| total += review.rating }
      (total.round(1) / self.reviews.length.round(1)).round(1)
    else
      average.to_f
    end
  end

private
  def titlecase
    new_name = self.name.split(' ')
      .each{|word| word.capitalize! }
      .join(' ')
    self.name = new_name
  end

  def upcase
    new_country = self.country_origin.upcase!
  end
end
