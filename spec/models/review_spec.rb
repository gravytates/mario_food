require 'rails_helper'

describe Review do
  it { should validate_presence_of :author }
  it { should validate_presence_of :content_body }
  it { should validate_presence_of :rating }
  it { should belong_to :product }

  it("returns false if it's too long of a store name") do
    product = Product.create!({name: "salt", image: "png", country_origin: "USA"})
    review = product.reviews.create({author: "a", content_body: "a"  * 251, rating: 1 })
    expect(review.save).to eq(false)
  end
end
