class Image < ActiveRecord::Base
  belongs_to :person
  validates_presence_of :person_id

  mount_uploader :file, ImageUploader
  
  def as_json(options={})
    super(only: [:id], methods: [:file_url])
  end

  def thumb_url
    if file_url && file.thumb
      file.thumb.url
    else
      ""
    end
  end
end
