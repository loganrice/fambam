require 'rails_helper'

# Convert
# Degrees minutes seconds formats (DDD MM SS + compass direction)
# into Signed degrees format (DDD.dddd)
#  
# example GPS Position : 40 deg 44' 49.36" N, 73 deg 56' 28.18" W
# converts to 40.7470444,-073.9411611
#
# Coordinates of Test File
# ["GPSLatitude", "37/1, 41/1, 4944/100"]
# ["GPSLongitude", "121/1, 3/1, 4184/100"]
# ["GPSLatitudeRef", "N"]
# ["GPSLongitudeRef", "W"]


describe Geolocation do
  let (:file) { File.open(File.join(Rails.root, 'spec', 'fixtures', 'modesto.JPG')) }
 
  describe '.extract' do
    let(:geolocation) { Geolocation.new(file) }

    it "sets the longitude DDD MM SS" do
      position = ["121/1", "3/1", "4184/100"]
      expect(geolocation.longitude).to eq(position)
    end
    
    it "sets the latitude DDD MM SS" do
      position = ["37/1", "41/1", "4944/100"]
      expect(geolocation.latitude).to eq(position)
    end

    it "sets the GPS latitude reference" do
      expect(geolocation.latitude_reference).to eq("N")
    end

    it "sets the GPS longitude reference" do
      expect(geolocation.longitude_reference).to eq("W")
    end
  end

  describe '.transform' do
    let(:geolocation) { Geolocation.new(file) }

    it "converts DD MM SS to signed degrees format" do
      expect(geolocation.longitude_degree).to eq(-121.06162222222223) 
      expect(geolocation.latitude_degree).to eq(37.697066666666665) 
    end
  end
end
