require "spec_helper"

describe Pairing do

  describe "#initialize" do

    let(:male) { build(:male) }

    let(:female) { build(:female) }

    it "accepts a male and female as parameters" do
      Pairing.new(male, female)
    end

  end


end