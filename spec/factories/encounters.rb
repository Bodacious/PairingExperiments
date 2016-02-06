FactoryGirl.define do
  factory :encounter do
    male { build(:male) }
    female { build(:female) }
    available_males 10
    available_females 10
    initialize_with { new(male, female, available_males, available_females) }
  end
end