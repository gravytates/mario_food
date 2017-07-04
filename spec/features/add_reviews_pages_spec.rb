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
    click_on "New Product"
    fill_in "Name", :with => 'Salsa'
    fill_in "Country origin", :with => 'Canada'
    fill_in "Cost", :with => '5.99'
    fill_in 'Image', :with => 'http://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/4/7/0/EA1D01_alton-salsa_s4x3.jpg.rend.hgtvcom.616.462.jpeg'
    click_on 'Create Product'
    click_on 'Salsa'
    click_on 'New Review'
    fill_in "Author", :with => 'Professor Snape'
    fill_in 'Content body', :with => 'This is a disgrace. You should be ashamed of your house and home. You are ever so like your father who I greatly despised and was not quite the hero people would leave you to believe'
    select "1", :from => "Rating"
    click_on 'Create Review'
    expect(page).to have_content "Salsa"
  end
end
