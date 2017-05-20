FactoryGirl.define do
  factory :user, aliases: [:guard] do
    email { Faker::Internet.email }
    password 'trombonne'
  end
end
