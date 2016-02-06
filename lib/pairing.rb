class Pairing

  attr_reader :male

  attr_reader :female

  def initialize(male, female)
    @male          = male
    @female        = female
    male.pairing   = self
    female.pairing = self
  end

end