def sign_in(a_person = nil)
  a_person = a_person || Fabricate(:person) 
  
  visit sign_in_path
  fill_in "Email", with: a_person.email
  fill_in "Password", with: a_person.password
  click_button "Sign in"
end

def sign_out
  visit sign_out_path
end

def set_current_person(a_person = nil)
  session[:person_id] = (a_person ||= Fabricate(:person)).id.to_s
end

def clear_current_signed_in_person
  session[:person_id] = nil
end

def submit_form
  find('input[name="commit"]').click
end

def mock_file
  file = File.open(File.join(Rails.root, 'spec', 'fixtures', 'family_photo.png'))
  Fabricate(:image, file: file, person_id: Fabricate(:person).id)
end

def simulate_coming_from_images_path(image = 1)
  request.env["HTTP_REFERER"] = "/images/1"
end
