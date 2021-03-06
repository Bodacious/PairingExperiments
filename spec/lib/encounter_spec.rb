require "spec_helper"
require "encounter"

describe Encounter do

  let(:male) { build(:male, attractiveness: 10) }

  let(:female) { build(:female, attractiveness: 10) }

  let(:encounter) { build(:encounter, male: male, female: female) }


  describe "#pairing" do

    subject { encounter.pairing }


    context "when only male approves female" do

      before do
        male.attractiveness = 1
        female.attractiveness = 10
      end

      it "will be nil" do
        expect(subject).to be_nil
      end

    end

    context "when only female approves male" do


      before do
        male.attractiveness = 10
        female.attractiveness = 1
      end

      it "will be nil" do
        expect(subject).to be_nil
      end

    end

    context "when neither approves the other" do


      before do
        male.attractiveness = 1
        female.attractiveness = 1
      end

      it "will be nil" do
        expect(subject).to be_nil
      end


    end

    context "when both approve eachother" do


      before do
        male.attractiveness = 10
        female.attractiveness = 10
      end


      it "will be a valid Pairing object" do
        expect(subject).to be_a(Pairing)
      end

    end


  end

end