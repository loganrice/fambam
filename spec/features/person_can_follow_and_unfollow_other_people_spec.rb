require 'rails_helper'

feature "Person can follow and unfollow other People" do
  scenario "A person signs in, selects a photo, and follows another person" do
    image = Fabricate(:image)
    sign_in_and_click_on_an_image(image)
    click_link "Follow"
    expect(page).to have_content "You are now following #{image.person.email}"

  end

  scenario "A person signs in, selects a photo and unfollows another person" do
    image = Fabricate(:image)
    sign_in_and_click_on_an_image(image)
    click_link "Follow"

    click_link "Unfollow"
    expect(page).to have_content "You are no longer following #{image.person.email}"
  end
end

def sign_in_and_click_on_an_image(image)
  john = Fabricate(:person)
  jane = Fabricate(:person)
  image.person = jane
  image.save

  sign_in(john)
  click_on_image_on_home_page image
end

def click_on_image_on_home_page(image)
  find("a[href='/images/#{image.id}']").click
end
  
