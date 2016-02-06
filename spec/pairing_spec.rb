require "spec_helper"

describe Pairing do

  describe "#initialize" do

    let(:male) { create(:male) }

    let(:female) { create(:female) }

    it "accepts a male and female as parameters" do
      Pairing.new(male, female)
    end

  end


end