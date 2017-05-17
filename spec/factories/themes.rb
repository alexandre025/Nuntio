FactoryGirl.define do
  factory :theme do
    name { Faker::Lorem.words(2) }

    after :create do |theme|
      10.times do
        create(:category, theme: theme)
      end
    end
  end
end
