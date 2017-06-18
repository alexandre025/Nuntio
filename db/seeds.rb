require 'factory_girl_rails'
require 'ruby-progressbar'
require 'csv'

# AdminUser.create!(email: 'admin@nuntio.me', password: 'nuntio', password_confirmation: 'nuntio')

# FactoryGirl.create(:user, email: 'admin@nuntio.me', password: 'nuntio', password_confirmation: 'nuntio')

themes = [
  { name: 'Développement',
    categories: ['Front-end', 'Back-end', 'Applications mobiles']
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

csv = File.read(Rails.root.join('db', 'seeds', 'data.csv'))
csv = CSV.parse(csv, headers: true, header_converters: :symbol, encoding: 'ISO-8859-1', col_sep: ';')
csv.to_a.map {|row| Hash[row[0], row[1]] }

csv.each_with_index do |row, idx|
  if row[:price_per_month_cents]
    guard = User.new({
        email: Faker::Internet.email,
        password: 'nuntio',
        firstname: row[:expert_firstname],
        lastname: row[:expert_lastname],
        terms: true
      })
    guard.save
    tower = Tower.new({
        title: row[:title],
        description: row[:description],
        price_per_month: row[:price_per_month_cents].to_d/100,
        frequency: row[:frequency],
        category_id: 1,
        grade: row[:grade],
        excerpt: row[:excerpt],
        short_excerpt: row[:short_excerpt],
        is_featured: row[:is_featured] == 'true',
        tower_guard_attributes: {
          guard_id: guard.id,
          description: row[:expert_description],
          short_excerpt: row[:short_excerpt],
          link_to_facebook: row[:expert_facebook],
          link_to_twitter: row[:expert_twitter],
          link_to_angellist: row[:expert_angellist],
          link_to_google: row[:expert_google],
          link_to_linkedin: row[:expert_linkedin],
          roles: ['author']
        }
      })
      tower.save
  end
end

# puts 'Create towers, guards and reports for each categories'
# progressbar = ProgressBar.create(total: Category.all.count)
# Category.all.each do |category|
#   10.times do
#     tower = FactoryGirl.create(:tower, :with_users, category: category)
#     FactoryGirl.create(:tower_guard, tower: tower)
#     10.times do
#       FactoryGirl.create(:report, tower: tower, tower_guard: tower.tower_guard)
#     end
#   end
#   progressbar.increment
# end
