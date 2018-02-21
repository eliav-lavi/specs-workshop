class Visa
  attr_accessor :length_in_days, :used, :type

  TYPES = PLEASURE_TYPES + BUSINESS_TYPES

  PLEASURE_TYPES = [
      TOURIST_TYPE = 'tourist',
      SPOUSE_TYPE = 'spouse'
  ]

  BUSINESS_TYPES = [
      BUSINESSMAN_TYPE = 'businessman',
      OUTSTANDING_ARTIST_TYPE = 'outstanding_artist'
  ]

  def business_type?
    BUSINESS_TYPES.include? @type
  end

  def pleasure_type?
    PLEASURE_TYPES.include? @type || @type.nil?
  end
end
