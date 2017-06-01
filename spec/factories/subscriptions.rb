FactoryGirl.define do
  factory :subscription do
    association :tower, factory: [:tower, :with_category]
    owner
    quantity 1
    commitment Subscription::COMMITMENTS.first
  end
end
