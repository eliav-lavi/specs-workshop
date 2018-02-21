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
