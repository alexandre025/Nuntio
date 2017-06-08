FactoryGirl.define do
  factory :tower_guard do
    guard
    short_excerpt { Faker::Lorem.sentence }
    excerpt { Faker::Lorem.paragraph(1) }
    description { Faker::Lorem.paragraph(2) }
    association :tower, factory: [:tower, :with_category]
    roles [TowerGuard::ROLES.first]
  end
end
