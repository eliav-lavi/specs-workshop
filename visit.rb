class Visa
  attr_accessor :length_in_days, :used, :type

  TYPES = PLEASURE_TYPES + BUSINESS_TYPES

  PLEASURE_TYPES = [
      A = 'a',
      B = 'b'
  ]

  BUSINESS_TYPES = [
      C = 'c',
      D = 'd'
  ]

  def business_type?
    BUSINESS_TYPES.include? @type
  end

  def pleasure_type?
    PLEASURE_TYPES.include? @type || @type.nil?
  end
end

class Visit
  def initialize(length_in_days, is_business_trip, visa)
    @length_in_days = length_in_days
    @is_business_trip = is_business_trip
    @visa = visa
  end

  def allowed?
    length_allowed? && purpose_allowed?
  end

  private

  def length_allowed?
    @length_in_days >= @visa.length_in_days
  end

  def purpose_allowed?
    return true if @visa.business_type?
    @is_business_trip
  end
end