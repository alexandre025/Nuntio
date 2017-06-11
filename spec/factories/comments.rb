FactoryGirl.define do
  factory :comment do
    association :commentable, factory: [:tower, :with_category]
    content { Faker::Lorem.paragraph(3) }
    notation { rand(2..5) }
    user
  end
end
