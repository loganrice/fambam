require 'rails_helper'

describe Image do
  it { should belong_to :person } 
  it { should validate_presence_of :person_id }

  describe '.as_json' do
    it 'includes id, file url' do
      an_image = Image.create(file: mock_file)
      image_json = {"id" => an_image.id, "file_url" => an_image.file_url}

      expect(an_image.as_json).to eq(image_json)
    end
  end

  describe '.thumb_url' do
    it 'includes the file thumb url' do
      an_image = mock_file
      expect(an_image.thumb_url).to eq(an_image.file.thumb.url)
    end

    it 'returns an empty string when no file url present' do
      an_image = Image.create

      expect(an_image.thumb_url).to eq("")
    end
  end

end
