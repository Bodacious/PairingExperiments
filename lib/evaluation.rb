class Evaluation


  attr_reader :subject

  attr_reader :object

  attr_accessor :outcome

  attr_reader :available_options


  def initialize(subject, object, available_options)
    raise "Subject must be an individual" unless subject.is_a?(Individual)
    raise "Object must be an individual"  unless object.is_a?(Individual)
    raise "Available options can't be nil" unless available_options
    @subject           = subject
    @object            = object
    @available_options = available_options
    @outcome           = nil
    evaluate!
  end

  def evaluate!
    case
      # They're super hot, just say yes!
    when object.attractiveness.in?(9..10)
      self.outcome = true


      # You've been rejected by someone lower, say yes!
    when subject.previously_rejected? && subject.rejected_by.max <= object.attractiveness
      self.outcome = true

      # You're running out of options, say yes!
    when self.available_options <= 2
      self.outcome = true

      # You've been rejected 3 times—you ugly! Say yes!
    when subject.rejection_count >= 3
      self.outcome = true

    else
      # Take a gamble on something better
      self.outcome = false
    end
  end

  def positive?
    self.outcome == true
  end

  def negative?
    self.outcome == false
  end

end