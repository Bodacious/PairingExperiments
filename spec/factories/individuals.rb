FactoryGirl.define do

  factory :individual do
    gender { Individual::GENDERS.sample }
    attractiveness { (1..10).to_a.sample }
    initialize_with { new(gender, attractiveness) }

    factory :male, parent: :individual do
      gender :male
    end

    factory :female, parent: :individual do
      gender :female
    end

    trait :unavailable do
      pairing { build(:pairing) }
    end

    trait :available do
      pairing nil
    end

  end

end