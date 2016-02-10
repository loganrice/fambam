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

def set_current_person(a_person =nil)
  session[:person_id] = (a_person || Fabricate(:person)).id.to_s
end
