require 'rails_helper'

feature "person uploads an image" do
  scenario "with authenticated sign in" do
    sign_in
    
    visit new_image_path
    
    attach_file("imageInput", File.expand_path('spec/fixtures/family_photo.png'))
    submit_form
    
    expect(page.status_code).to eq(200)

  end 
  
end


