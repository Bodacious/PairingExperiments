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
    @all ||= begin
      array = []
      GENDERS.each do |gender|
        ATTRACTIVENESS.each do |attractiveness|
          array << new(gender, attractiveness)
        end
      end
      array
    end
  end

  def self.pair_off
    begin
      puts "Available males: #{Individual.available_males.size}"
      puts "Available females: #{Individual.available_females.size}"
      Encounter.
        new(Individual.available_males.sample, Individual.available_females.sample)
    end until Individual.all.select(&:available?).empty?
  end

  def initialize(gender, attractiveness)
    @gender         = gender
    @attractiveness = attractiveness
    @rejected_by    = []
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

  def evaluate_individual(other)
    case
    when other.attractiveness.in?(8..10) then true
    when rejected_by.max.to_i >= other.attractiveness then true
    else
      false
    end
  end

  def save!
    # :noop:
  end

end
