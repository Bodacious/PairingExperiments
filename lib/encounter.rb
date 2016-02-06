class Encounter

  attr_reader :male, :female, :pairing

  def initialize(male = nil, female = nil)
    @male                 = male
    @female               = female
    if both_evaluations_affirmative?
      @pairing = Pairing.new(male, female)
    else
      male.rejected_by << female.attractiveness unless evaluation_of_male
      female.rejected_by << male.attractiveness unless evaluation_of_female
    end
  end


  private


  def evaluation_of_male
    @evaluation_of_male ||= female.evaluate_individual(male)
  end

  def evaluation_of_female
    @evaluation_of_female ||= male.evaluate_individual(female)
  end

  def both_evaluations_affirmative?
    evaluation_of_male && evaluation_of_female
  end

end
