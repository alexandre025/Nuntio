FactoryGirl.define do
  factory :report_source do
    url { Faker::Internet.url }
    report
  end
end
