class Person
  attr_reader :first_name, :last_name, :education_level

  def initialize(first_name, last_name, education_level = 0)
    @first_name = first_name
    @last_name = last_name
    @education_level = education_level
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def educate!
    @education_level += 1
  end
end
