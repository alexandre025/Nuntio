FactoryGirl.define do
  factory :credit_card do
    month 01
    year 2018
    last_digits 5555
    cc_type { Faker::Business.credit_card_type }
    user
  end
end
