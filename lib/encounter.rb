class Encounter

  attr_reader :male, :female, :pairing, :available_males, :available_females


  def initialize(male = nil, female = nil, available_males, available_females)
    @male              = male
    @female            = female
    @available_males   = available_males
    @available_females = available_females
    puts "Encounter: #{male} - #{evaluation_of_male.outcome}, #{female} - #{evaluation_of_female.outcome}, #{available_males}, #{available_females}"

    if both_evaluations_positive?
      @pairing = Pairing.new(male, female)
    else
      male.rejected_by   << female.attractiveness if evaluation_of_male.negative?
      female.rejected_by << male.attractiveness   if evaluation_of_female.negative?
    end
  end


  private


  def evaluation_of_male
    @evaluation_of_male ||= Evaluation.new(female, male, available_males)
  end

  def evaluation_of_female
    @evaluation_of_female ||= Evaluation.new(male, female, available_females)
  end

  def both_evaluations_positive?
    evaluation_of_male.positive? && evaluation_of_female.positive?
  end

end
