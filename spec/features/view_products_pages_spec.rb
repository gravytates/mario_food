require 'rails_helper'

describe "navigation to the products page" do
  it "navigates to products page" do
    visit root_path
    click_link("Products")
    expect(page).to have_content "New Product"
  end

  it "navigates to products page and filters incorrectly" do
    visit root_path
    click_link "Products"
    click_link "Recent"
    expect(page).to have_content "New Product"
  end
end
