class Image < ActiveRecord::Base
  belongs_to :person
  validates_presence_of :person_id
  mount_uploader :file, ImageUploader
  before_save :extract_geolocation, :fetch_address
  acts_as_taggable

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

  private

  def extract_geolocation
    geo = Geolocation.new(file.path)
    self.latitude = geo.try(:latitude_degree)
    self.longitude = geo.try(:longitude_degree)
  end

  def fetch_address
    if geo = Geocoder.search("#{self.latitude},#{self.longitude}").first
      self.city = geo.city
      self.state = geo.country
      self.country = geo.country
      self.tag_list = "#{city}, #{state}, #{country}"
    end
  end
end
