ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :firstname, :lastname, :terms

  index do
    selectable_column
    id_column
    column :email
    column :firstname
    column :lastname
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :firstname
  filter :lastname
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs 'Admin Details' do
      f.input :email
      f.input :firstname
      f.input :lastname
      f.input :password
      f.input :password_confirmation
      f.input :terms, as: :hidden, input_html: { value: true }
    end
    f.actions
  end

end
