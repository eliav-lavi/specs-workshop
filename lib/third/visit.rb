class Visit
  def initialize(visa, length_in_days, is_business_trip)
    @visa = visa
    @length_in_days = length_in_days
    @is_business_trip = is_business_trip
  end

  def allowed?
    return true if @visa.green_card_candidate?
    length_allowed? && purpose_allowed?
  end

  private

  def length_allowed?
    @length_in_days <= @visa.length_in_days
  end

  def purpose_allowed?
    @is_business_trip ? @visa.business_type? : true
  end
end
