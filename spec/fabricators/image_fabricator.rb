Fabricator(:image) do
  file { File.open(File.join(Rails.root, 'spec', 'fixtures', 'family_photo.png')) }
end
