require 'factory_girl_rails'
require 'ruby-progressbar'

puts 'Create themes and categories'
progressbar = ProgressBar.create(total: 7)
%w(Developpement Design SEO Marketing Business Finances Juridique).each do |theme_name|
  FactoryGirl.create(:theme, name: theme_name)
  progressbar.increment
end

puts 'Create towers, guards and reports for each categories'
progressbar = ProgressBar.create(total: Category.all.count)
Category.all.each do |category|
  10.times do
    tower = FactoryGirl.create(:tower, category: category)
    FactoryGirl.create(:tower_guard, tower: tower)
    10.times do
      FactoryGirl.create(:report, tower: tower, tower_guard: tower.tower_guard)
    end
  end
  progressbar.increment
end
