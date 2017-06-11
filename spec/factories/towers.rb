FactoryGirl.define do
  factory :tower do
    title { Faker::Lorem.words(2, true).join(' ') }
    short_excerpt { Faker::Lorem.sentence }
    excerpt { Faker::Lorem.paragraph(1) }
    description { Faker::Lorem.paragraph(2) }
    price_per_month { rand(4..30) }
    locales [:fr]
    frequency Tower::FREQUENCIES.first
    grade Tower::GRADES.first

    trait :with_category do
      association :category, factory: [:category, :with_theme]
    end
  end
end
