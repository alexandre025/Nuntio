FactoryGirl.define do
  factory :category do
    name { Faker::Lorem.words(2, true).join(' ') }

    trait :with_theme do
      theme
    end
  end
end
