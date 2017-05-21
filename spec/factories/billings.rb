FactoryGirl.define do
  factory :billing do
    subscription
    begin_at { Date.current }
    end_at { Date.current + 30 }
  end
end
