require "active_support/core_ext/object"

class Individual


  GENDERS = [:male, :female]

  ATTRACTIVENESS = (1..10).to_a


  attr_accessor :attractiveness

  attr_reader :gender

  attr_accessor :available

  attr_accessor :pairing

  attr_reader :rejected_by


  def self.available_females
    all.select(&:female?).select(&:available?)
  end

  def self.available_males
    all.select(&:male?).select(&:available?)
  end

  def self.all
    @all ||= []
  end

  def self.reset_all
    @all = []
  end

  def self.pair_all
    loop do
      if available_males.any? && available_females.any?
        Encounter.new(available_males.sample, available_females.sample,
          available_males.size, available_females.size)
      else
        break
      end
    end
  end



  def initialize(gender, attractiveness)
    @gender         = gender
    @attractiveness = attractiveness
    @rejected_by    = []
    self.class.all << self
  end

  def rejection_count
    rejected_by.count
  end

  def previously_rejected?
    rejection_count > 0
  end

  def to_s
    "#{gender} (#{attractiveness})"
  end

  def female?
    gender == :female
  end

  def male?
    gender == :male
  end

  def available?
    partner.nil?
  end

  def partner
    if pairing
      male? ? pairing.female : pairing.male
    end
  end

  def save!
    # :noop:
  end

end
