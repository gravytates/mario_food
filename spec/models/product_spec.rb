require 'rails_helper'

describe Product do
  it { should validate_presence_of :name }
  it { should validate_presence_of :country_origin }
  it { should validate_presence_of :image }
  it { should validate_presence_of :cost }
  it { should have_many :reviews }

  describe "#titlecase" do
    it("titlecases the name of the product") do
      product = FactoryGirl.create(:product)
      expect(product.name).to eq("Salsa")
    end
  end

  describe "#upcase" do
    it("titlecases the name of the product") do
      product = FactoryGirl.create(:product)
      expect(product.country_origin).to eq("CANADA")
    end
  end


end
