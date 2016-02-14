require 'rails_helper'

feature "person uploads an image" do
  scenario "with authenticated sign in" do
    sign_in
    
    visit new_image_path
    
    attach_file("imageInput", File.expand_path('spec/fixtures/family_photo.png'))
    submit_form
    
    expect(page).to have_content "family_photo.png"

  end 
  
end


