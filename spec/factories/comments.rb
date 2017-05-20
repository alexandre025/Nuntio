FactoryGirl.define do
  factory :comment do
    association :commentable, factory: [:tower, :with_category]
    content { Faker::Lorem.paragraph(3) }
    user
  end
end
