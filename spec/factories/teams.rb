FactoryGirl.define do
  factory :team do
    name { Faker::Team.name }
    code { Faker::Internet.slug }
  end
end
