require 'factory_girl_rails'
require 'ruby-progressbar'
require 'csv'

AdminUser.create!(email: 'admin@nuntio.me', password: 'nuntio', password_confirmation: 'nuntio')

FactoryGirl.create(:user, email: 'admin@nuntio.me', password: 'nuntio', password_confirmation: 'nuntio')

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

puts 'Import db/seeds/data.csv'
csv = File.read(Rails.root.join('lib', 'data', 'data.csv'))
csv = CSV.parse(csv, headers: true, header_converters: :symbol, encoding: 'ISO-8859-1', col_sep: ';')
csv.to_a.map { |row| Hash[row[0], row[1]] }

progressbar = ProgressBar.create(total: csv.size)

csv.each_with_index do |row, idx|
  if row[:price_per_month_cents]
    guard = User.new(email: Faker::Internet.email,
        password: 'nuntio',
        firstname: row[:expert_firstname],
        lastname: row[:expert_lastname],
        terms: true)
    guard.save

    tower = Tower.new(title: row[:title],
        description: row[:description],
        price_per_month: row[:price_per_month_cents].to_d / 100,
        frequency: row[:frequency],
        category_id: row[:category_id],
        grade: row[:grade],
        excerpt: row[:excerpt],
        short_excerpt: row[:short_excerpt],
        is_featured: row[:is_featured] == 'TRUE',
        tower_guard_attributes: {
          guard_id: guard.id,
          description: row[:expert_description],
          short_excerpt: row[:expert_short_excerpt],
          link_to_facebook: row[:expert_facebook],
          link_to_twitter: row[:expert_twitter],
          link_to_angellist: row[:expert_angellist],
          link_to_google: row[:expert_google],
          link_to_linkedin: row[:expert_linkedin],
          roles: ['author']
        })

    if image = File.open(Rails.root.join('lib', 'data', 'images', row[:filename]))
      tower.image = image
    end

    if tower.save
      3.times do |i|
        if row["report_#{i}_title".to_sym]

          report = Report.new(
              title: row["report_#{i}_title".to_sym],
              content: row["report_#{i}_content".to_sym],
              excerpt: row["report_#{i}_excerpt".to_sym],
              created_at: row["report_#{i}_created_at".to_sym]&.to_datetime,
              tower: tower,
              tower_guard: tower.tower_guard
            )

          # if image = File.read(Rails.root.join('lib', 'data', 'images', row["report_#{i}_filename".to_sym]))
          #   report.image = image
          # end

          report.save
        end
      end
    end
  end
  progressbar.increment
end

puts 'Fake comments and notations'
progressbar = ProgressBar.create(total: Tower.all.count)
Tower.all.each do |tower|
  rand(6..14).times do
    subscription = FactoryGirl.create(:subscription, tower: tower)
    subscription.to_payment!
    subscription.confirm!

    FactoryGirl.create(:comment, commentable: tower, user: subscription.owner)
  end
  progressbar.increment
end

puts 'Done !'
