require_relative "individual"
require_relative "encounter"
require_relative "pairing"
module Experiment


  module_function

  def run!
    Individual.pair_off
    print_report
  end


  def print_report
    Individual.all.each do |individual|
      puts "Individual #{individual} paired with #{individual}"
    end
  end

end
