ActiveAdmin.register Category do
  permit_params :theme_id, :name

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  form do |f|
    f.inputs 'Category details' do
      f.input :theme
      f.input :name
    end
    f.actions
  end

end
