require_relative "individual"
require_relative "encounter"
require_relative "pairing"
require_relative "evaluation"

module Experiment


  module_function

  def run!
    Individual.pair_all
    print_report
  end


  def print_report
    Individual.all.each do |individual|
      puts "Individual #{individual} paired with #{individual}"
    end
  end

end
