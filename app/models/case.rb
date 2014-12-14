class Case < ActiveRecord::Base
  #needed by the geocoder gem
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode
end