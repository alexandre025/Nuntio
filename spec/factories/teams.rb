FactoryGirl.define do
  factory :team do
    name { Faker::Team.name }
    code { name.downcase.gsub(/[^0-9A-Za-z]/, '-') }
  end
end
