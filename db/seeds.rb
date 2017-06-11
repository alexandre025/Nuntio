require 'factory_girl_rails'
require 'ruby-progressbar'

AdminUser.create!(email: 'admin@nuntio.me', password: 'nuntio', password_confirmation: 'nuntio')

FactoryGirl.create(:user, email: 'admin@nuntio.me', password: 'nuntio', password_confirmation: 'nuntio')

themes = [
  { name: 'Développement',
    categories: ['Développement web', 'Développement mobile', 'DevOps', 'Autres']
  },
  { name: 'Marketing',
    categories: ['Numérique', 'SEO', 'Social media', 'Analytics', 'Publicité', 'Vidéo & mobile', 'Contenu', 'Growth hacking', 'Affiliation', 'Produits', 'Mobile', 'Autres']
  },
  { name: 'Business',
    categories: ['Finance', 'Entrepreunariat', 'Communication', 'Gestion', 'Stratégie', 'Gestion de projets', 'Autres']
  },
  { name: 'Design',
    categories: ['Conception mobile', 'Conception web', 'Design produit', 'Expérience utilisateur', 'Conception de jeux', '3D & animations', 'Motion design', 'Autres']
  },
  { name: 'Innovation',
    categories: ['Fab lab', 'IOT', 'Robotique', 'Réalité virtuelle', 'Nouvelles technologies', 'Autres']
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
