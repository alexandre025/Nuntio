FactoryGirl.define do
  factory :category do
    name { Faker::Lorem.words(2) }

    trait :with_theme do
      theme
    end
  end
end
