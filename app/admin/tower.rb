ActiveAdmin.register Tower do
  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    selectable_column
    id_column
    column :title
    column :category do |tower|
      link_to tower.category.name, admin_category_path(tower.category)
    end
    column :guard do |tower|
      link_to tower.guard.fullname, admin_user_path(tower.guard)
    end
    column :excerpt
    column :created_at
    actions
  end

  filter :title
  filter :category
  filter :guard, collection: proc { TowerGuard.all.map{ |tg| [tg.guard.fullname, tg.guard.id]} }
  filter :excerpt
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :title
      f.input :excerpt
      f.input :short_excerpt
      f.input :description
      f.input :locales, collection: [:fr, :en, :de, :be]
      f.input :price_per_month
      f.input :frequency, collection: Tower::FREQUENCIES
      f.input :category
      f.input :grade, collection: Tower::GRADES
    end
    f.actions
  end
end
