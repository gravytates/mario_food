require 'rails_helper'

describe "add, edit and delete a product" do
  it "will add a product and successfully redirect" do
    visit products_path
    click_on "New Product"
    fill_in "Name", :with => 'Salsa'
    fill_in "Country origin", :with => 'Canada'
    fill_in "Cost", :with => '5.99'
    fill_in 'Image', :with => 'http://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/4/7/0/EA1D01_alton-salsa_s4x3.jpg.rend.hgtvcom.616.462.jpeg'
    click_on 'Create Product'
    expect(page).to have_content "Product successfully added!"
  end

  it 'will delete a product and successfully redirect' do
    visit products_path
    click_on "New Product"
    fill_in "Name", :with => 'Salsa'
    fill_in "Country origin", :with => 'Canada'
    fill_in "Cost", :with => '5.99'
    fill_in 'Image', :with => 'http://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/4/7/0/EA1D01_alton-salsa_s4x3.jpg.rend.hgtvcom.616.462.jpeg'
    click_on 'Create Product'
    click_on 'Salsa'
    click_on 'Delete'
    expect(page).to have_content "Product successfully removed!"
  end

  it 'will delete a product and successfully redirect' do
    visit products_path
    click_on "New Product"
    fill_in "Name", :with => 'Salsa'
    fill_in "Country origin", :with => 'Canada'
    fill_in "Cost", :with => '5.99'
    fill_in 'Image', :with => 'http://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/4/7/0/EA1D01_alton-salsa_s4x3.jpg.rend.hgtvcom.616.462.jpeg'
    click_on 'Create Product'
    click_on 'Salsa'
    click_on 'Edit'
    fill_in "Name", :with => 'Spicy Ketchup'
    click_on 'Update Product'
    expect(page).to have_content "Product successfully updated!"
  end
end
