require 'rails_helper'

describe Product do
  it { should validate_presence_of :name }
  it { should validate_presence_of :country_origin }
  it { should validate_presence_of :image }
  it { should validate_presence_of :cost }
  it { should have_many :reviews }

  describe "#titlecase" do
    it("titlecases the name of the product") do
      product = Product.create!({name: "salt", image: "png", cost: "5", country_origin: "USA"})
      expect(product.name).to eq("Salt")
    end
  end

  describe "#upcase" do
    it("titlecases the name of the product") do
      product = Product.create!({name: "salt", image: "png", cost: "5", country_origin: "usa"})
      expect(product.country_origin).to eq("USA")
    end
  end


end
