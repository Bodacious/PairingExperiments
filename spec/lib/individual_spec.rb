require "spec_helper"

describe Individual do

  describe "::all" do

    it "returns all of the buildd Individuals" do
      build_list(:male, 3)
      build_list(:female, 4)
      expect(Individual.all.size).to eql(7)
    end

  end


  describe "::available_females" do

    before do
      build_list(:female, 2, :available)
      build_list(:female, 2, :unavailable)
    end

    it "returns all females who are currently available" do
      expect(Individual.available_females).to have_exactly(2).items
    end

    it "stays up-to-date as records are updated" do
      Pairing.new(build(:male), Individual.available_females.first)
      expect(Individual.available_females).to have_exactly(1).item
    end

  end

  describe "::pair_all" do

    context "when an equal number of males and females" do

      before do
        build_list(:male, 10)
        build_list(:female, 10)
        Individual.pair_all
      end

      it "finds a partner for each individual" do
        expect(Individual.all.select(&:available?)).to be_empty
      end

    end

    context "when an inequal number of males and females"

    before do
      build_list(:male, 5)
      build_list(:female, 4)
      Individual.pair_all
    end

    it "finds a partner for as many individuals" do
      expect(Individual.all.select(&:female?).detect(&:available?)).to be_nil
      expect(Individual.all.select(&:available?)).to have_exactly(1).item
    end

  end

  describe "#available?" do

    it "returns true when no pairing" do
      expect(build(:male, :available)).to be_available
    end

    it "returns true when no pairing" do
      expect(build(:male, :unavailable)).not_to be_available
    end

  end

end
