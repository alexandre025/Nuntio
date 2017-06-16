require 'factory_girl_rails'
require 'ruby-progressbar'
require 'csv'

AdminUser.create!(email: 'admin@nuntio.me', password: 'nuntio', password_confirmation: 'nuntio')

FactoryGirl.create(:user, email: 'admin@nuntio.me', password: 'nuntio', password_confirmation: 'nuntio')

themes = [
  { name: 'Développement',
    categories: ['Développement front-end', 'Développement back-end', 'Applications mobiles']
  },
  { name: 'Marketing',
    categories: ['Marketing numérique', 'Publicité', 'Marketing vidéo et mobile', 'Marketing de contenu', 'Growth Hacking', 'Mobile marketing', 'Social Media', 'Autres']
  },
  { name: 'Business',
    categories: ['Entrepreneuriat', 'Communication', 'Gestion de projet', 'Transformation digitale']
  },
  { name: 'Design',
    categories: ['Design d’interface', 'Direction artistique', 'Expérience utilisateur']
  },
  { name: 'Innovation',
    categories: ['IOT', 'Réalité virtuelle']
  }
]

puts 'Create themes and categories'
progressbar = ProgressBar.create(total: 5)
themes.each do |row|
  theme = Theme.create(name: row[:name])
  row[:categories].each do |category|
    Category.create(theme: theme, name: category)
  end
  progressbar.increment
end

# csv = File.read(Lump::Engine.root.join('lib', 'seeds', 'seed_towers.csv'))
# csv = CSV.parse(csv, headers: true, encoding: 'ISO-8859-1') # col_sep: ';'
#
# csv.each_with_index do |row, idx|
#   row['title'] ...
# end

puts 'Create towers, guards and reports for each categories'
progressbar = ProgressBar.create(total: Category.all.count)
Category.all.each do |category|
  10.times do
    tower = FactoryGirl.create(:tower, :with_users, category: category)
    FactoryGirl.create(:tower_guard, tower: tower)
    10.times do
      FactoryGirl.create(:report, tower: tower, tower_guard: tower.tower_guard)
    end
  end
  progressbar.increment
end
