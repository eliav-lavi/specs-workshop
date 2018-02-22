class Visa
  attr_reader :length_in_days, :type

  PLEASURE_TYPES = [
      TOURIST_TYPE = 'tourist',
      SPOUSE_TYPE = 'spouse'
  ]

  BUSINESS_TYPES = [
      BUSINESSMAN_TYPE = 'businessman',
      OUTSTANDING_ARTIST_TYPE = 'outstanding_artist'
  ]

  def initialize(length_in_days, type = TOURIST_TYPE)
    @length_in_days = length_in_days
    @type = type
  end

  def business_type?
    BUSINESS_TYPES.include? @type
  end

  def green_card_candidate?
    @type == SPOUSE_TYPE && @length_in_days < 0
  end
end
