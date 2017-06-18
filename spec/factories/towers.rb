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
    is_featured { rand(0..1) }

    after :build do |tower|
      FactoryGirl.build(:tower_guard, tower: tower)
    end

    trait :with_users do
      after :build do |tower|
        rand(10..20).times do
          subscription = FactoryGirl.create(:subscription, tower: tower)
          subscription.to_payment!
          subscription.confirm!

          FactoryGirl.create(:comment, commentable: tower, user: subscription.owner)
        end
      end
    end

    trait :with_category do
      association :category, factory: [:category, :with_theme]
    end
  end
end
