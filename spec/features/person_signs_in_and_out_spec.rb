require 'rails_helper'

feature "Person signs in" do
  scenario "with valid email and password" do 
    sign_in

    expect(page).to have_content "You are now signed in"
  end
end

feature "Person signs out" do
  scenario "after valid sign in" do 
    sign_in

    click_link "Sign Out"

    expect(page).to have_content "You are now signed out"
  end
end

