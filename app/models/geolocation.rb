class Geolocation
  attr_reader :longitude, :latitude, :latitude_reference,
    :longitude_reference, :longitude_degree, :latitude_degree

  def initialize(file)
    return unless file
    @image = Magick::Image.read(file)[0] rescue nil
    extract
    transform
  end

  def extract
    self.longitude = get_exif_gps("GPSLongitude")
    self.latitude = get_exif_gps("GPSLatitude")
    self.latitude_reference = get_exif_compass_direction("GPSLatitudeRef")
    self.longitude_reference = get_exif_compass_direction("GPSLongitudeRef")
  end

  def transform
    return unless all_coordinates_exist?
    lat_degree = to_degree_format(latitude)
    lat_degree *= -1 if latitude_reference == "S"

    long_degree = to_degree_format(longitude)
    long_degree *= -1 if longitude_reference == "W"

    self.latitude_degree = lat_degree
    self.longitude_degree = long_degree
  end
  
  private

  attr_writer :longitude, :latitude, :latitude_reference,
    :longitude_reference, :longitude_degree, :latitude_degree

  def to_degree_format(coordinate)
    dd = to_fraction(coordinate[0])
    mm = to_fraction(coordinate[1]) / 60
    ss = to_fraction(coordinate[2]) / 3600

    (dd + mm + ss)
  end

  def all_coordinates_exist?
    longitude && latitude && latitude_reference && longitude_reference
  end

  def get_exif_gps(entry)
    @image.get_exif_by_entry(entry)[0][1].split(', ') rescue nil
  end

  def get_exif_compass_direction(entry)
    @image.get_exif_by_entry(entry)[0][1] rescue nil
  end

  def to_fraction(string)
    numerator, denominator = string.split('/').map(&:to_f)
    denominator ||= 1
    numerator/denominator
  end

end
