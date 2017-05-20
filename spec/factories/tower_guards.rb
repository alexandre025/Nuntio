FactoryGirl.define do
  factory :tower_guard do
    guard
    association :tower, factory: [:tower, :with_category]
    roles [TowerGuard::ROLES.first]
  end
end
