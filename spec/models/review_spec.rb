require 'rails_helper'

describe Review do
  it { should validate_presence_of :author }
  it { should validate_presence_of :content_body }
  it { should validate_presence_of :rating }
  it { should belong_to :product }


  it("titlecases the name of the author") do
    product = Product.create!({name: "salt", image: "png", cost: "5", country_origin: "USA"})
    review = product.reviews.create({author: "a", content_body: "a" * 200, rating: 4 })
    expect(review.author).to eq("A")
  end


  it("returns false if it's too long of a review") do
    product = Product.create!({name: "salt", image: "png", cost: "5", country_origin: "USA"})
    review = product.reviews.create({author: "a", content_body: "a"  * 251, rating: 1 })
    expect(review.save).to eq(false)
  end

  it("returns false if it's too short of a review") do
    product = Product.create!({name: "salt", image: "png", cost: "5", country_origin: "USA"})
    review = product.reviews.create({author: "a", content_body: "a", rating: 1 })
    expect(review.save).to eq(false)
  end

  it("returns false if it's too high a rating") do
    product = Product.create!({name: "salt", image: "png", cost: "5", country_origin: "USA"})
    review = product.reviews.create({author: "a", content_body: "a" * 200, rating: 6 })
    expect(review.save).to eq(false)
  end

  it("returns false if it's too low a rating") do
    product = Product.create!({name: "salt", image: "png", cost: "5", country_origin: "USA"})
    review = product.reviews.create({author: "a", content_body: "a" * 200, rating: 0 })
    expect(review.save).to eq(false)
  end
end
