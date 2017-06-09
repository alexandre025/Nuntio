Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout' }

  get 'dashboard', to: 'dashboard#index'

  get 'towers', to: 'towers#index'
  get 'towers/:id', to: 'towers#theme', as: :theme_towers
  get 'towers/:theme_id/:id', to: 'towers#category', as: :category_towers
  get 'search', to: 'towers#search', as: :search_towers

  get 'apply-tower-guards', to: 'tower_guards#apply'
  get 'apply-tower-guards-confirm', to: 'tower_guards#apply_confirm'
  post 'apply-tower-guards', to: 'tower_guards#apply_create'

  get 'reports/:id', to: 'reports#show'

  resource :subscription, only: [:create, :edit, :update] do
    post 'simulate'
    get 'payment'
  end

  get ':id', to: 'towers#show', as: :tower

end
