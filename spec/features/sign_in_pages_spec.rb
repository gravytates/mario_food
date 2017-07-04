require 'rails_helper'

describe "sign up, sign out and sign in" do
  it "will sign a user up" do
    visit root_path
    click_link "Sign up"
    fill_in "user_email", with: "christ@god.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Sign Up"
    expect(page).to have_content "You've successfully signed up!"
  end

  it "will produce errors in signing up" do
    visit root_path
    click_link "Sign up"
    fill_in "user_email", with: "christ@god.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Sign Up"
    expect(page).to have_content "You've successfully signed up!"
    click_on "Sign out"
    click_link "Sign up"
    fill_in "user_email", with: "christ@god.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Sign Up"
    expect(page).to have_content "There was a problem signing up."
  end

  it "will sign a user in" do
    visit root_path
    click_link "Sign up"
    fill_in "user_email", with: "christ@god.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Sign Up"
    expect(page).to have_content "You've successfully signed up!"
    visit products_path
    click_on "Sign out"
    click_link 'Sign in'
    fill_in "email", with: "christ@god.com"
    fill_in "password", with: "123456"
    click_button "Sign in"
    expect(page).to have_content "You've signed in."
  end

  it "will create error upon unauthorized password" do
    visit root_path
    click_link "Sign up"
    fill_in "user_email", with: "christ@god.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Sign Up"
    expect(page).to have_content "You've successfully signed up!"
    visit products_path
    click_on "Sign out"
    click_link 'Sign in'
    fill_in "email", with: "christ@god.com"
    fill_in "password", with: "12345777"
    click_button "Sign in"
    expect(page).to have_content "There was a problem signing in. Please try again."
  end

  it "will give unauthorized access messages" do
    visit products_path
    product = FactoryGirl.create(:product)
    visit products_path
    click_on "#{product.name}"
    click_on 'New Review'
    expect(page).to have_content "You aren't authorized to visit that page."
  end

end
