require 'rails_helper'

describe "navigation to the products detail page" do
  it "navigates to products detail page" do
    visit root_path
    click_link("Sign up")
    fill_in "user_email", with: "christ@god.com"
    fill_in("user_password", with: "123456")
    fill_in("user_password_confirmation", with: "123456")
    click_button("Sign Up")
    expect(page).to have_content("You've successfully signed up!")
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
