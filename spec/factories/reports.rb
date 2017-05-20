FactoryGirl.define do
  factory :report do
    title { Faker::Lorem.words(2) }
    content { Faker::Lorem.paragraph(3) }

    after :build do |report|
      tower_guard = create(:tower_guard)
      report.tower = tower_guard.tower
      report.tower_guard = tower_guard
    end
  end
end
