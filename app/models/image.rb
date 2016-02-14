class Image < ActiveRecord::Base
  mount_uploader :file, ImageUploader
  
  def as_json(options={})
    super(only: [:id], methods: [:file_url])
  end
end
