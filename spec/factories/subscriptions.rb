FactoryGirl.define do
  factory :subscription do
    association :tower, factory: [:tower, :with_category]
    owner
    recurrence Subscription::RECURRENCES.first
  end
end
