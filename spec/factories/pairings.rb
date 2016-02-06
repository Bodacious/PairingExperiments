FactoryGirl.define do
  factory :pairing do
    male { create(:male) }
    female { create(:female) }

    initialize_with { new(male, female) }
  end
end