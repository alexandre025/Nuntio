FactoryGirl.define do
  factory :tower do
    title { Faker::Lorem.words(2, true).join(' ') }
    description { Faker::Lorem.paragraph(2) }
    price_per_month { Faker::Number.decimal(2, 2) }
    locales [:fr]
    frequency Tower::FREQUENCIES.first

    trait :with_category do
      association :category, factory: [:category, :with_theme]
    end
  end
end
