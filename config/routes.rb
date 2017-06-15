# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'home#index'

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout' }, controllers: { registrations: 'users/registrations' }

  get 'dashboard', to: 'dashboard#index'

  resources :towers, only: :index do
    get '/:id', to: 'towers#theme', as: :theme, on: :collection
    get '/:theme_id/:id', to: 'towers#category', as: :category, on: :collection

    resources :reports, only: :show
  end

  post 'search', to: 'towers#search', as: :search_towers

  get 'apply-tower-guards', to: 'tower_guards#apply'
  post 'apply-tower-guards', to: 'tower_guards#apply_create'
  get 'apply-tower-guards-confirm', to: 'tower_guards#apply_confirm'

  get 'settings', to: 'settings#index'
  patch 'settings/general', to: 'settings#general_update'
  patch 'settings/password', to: 'settings#password_update'

  resource :subscription, only: [:create, :edit, :update] do
    post 'simulate'
    get 'payment'
    get 'confirmation'
  end

  get ':id', to: 'towers#show', as: :tower

  get '*path' => redirect('/')

end
