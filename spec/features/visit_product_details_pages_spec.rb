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
    product = FactoryGirl.create(:product)
    visit products_path
    click_on "#{product.name}"
    expect(page).to have_content "Average User Rating"
  end
end
