FactoryGirl.define do
  factory :pairing do
    male { build(:male) }
    female { build(:female) }

    initialize_with { new(male, female) }
  end
end