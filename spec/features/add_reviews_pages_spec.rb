require 'rails_helper'

describe "add a review" do
  it "will add a review to a product and successfully redirect" do
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
    click_on 'New Review'
    fill_in "Author", :with => 'Professor Snape'
    fill_in 'Content body', :with => 'This is a disgrace. You should be ashamed of your house and home. You are ever so like your father who I greatly despised and was not quite the hero people would leave you to believe'
    select "1", :from => "Rating"
    click_on 'Create Review'
    expect(page).to have_content "Salsa"
  end
end
