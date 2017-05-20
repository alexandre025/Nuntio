FactoryGirl.define do
  factory :subscription do
    tower
    owner
    recurrence Subscription::RECURRENCES.first
  end
end
