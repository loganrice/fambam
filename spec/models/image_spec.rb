require 'rails_helper'

describe Image do
  describe '.as_json' do
    it 'includes id, file url' do
      mock_file = Fabricate(:image).file

      an_image = Image.create(file: mock_file)
      image_json = {"id" => an_image.id, "file_url" => an_image.file_url}

      expect(an_image.as_json).to eq(image_json)
    end
  end
end
