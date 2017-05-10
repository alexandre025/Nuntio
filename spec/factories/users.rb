FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'trombonne'
  end
end
