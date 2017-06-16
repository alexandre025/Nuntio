FactoryGirl.define do
  factory :user, aliases: [:guard, :owner] do
    email { Faker::Internet.email }
    password 'trombonne'
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    terms true
  end
end
