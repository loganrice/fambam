Fabricator(:person) do
  email { Faker::Internet.email }
  password { Faker::Internet.password }
end
