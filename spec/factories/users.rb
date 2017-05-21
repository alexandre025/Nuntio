FactoryGirl.define do
  factory :user, aliases: [:guard, :owner] do
    email { Faker::Internet.email }
    password 'trombonne'
  end
end
