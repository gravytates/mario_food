require 'rails_helper'

describe "navigation to the products detail page" do
  it "navigates to products detail page" do
    visit products_path
    click_on "New Product"
    fill_in "Name", :with => 'Salsa'
    fill_in "Country origin", :with => 'Canada'
    fill_in "Cost", :with => '5.99'
    fill_in 'Image', :with => 'http://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/4/7/0/EA1D01_alton-salsa_s4x3.jpg.rend.hgtvcom.616.462.jpeg'
    click_on 'Create Product'
    click_on 'Salsa'
    expect(page).to have_content "Average User Rating"
  end
end