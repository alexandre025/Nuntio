Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout' }

  get 'dashboard', to: 'dashboard#index'

  get 'towers', to: 'towers#index'
  get 'towers/:id', to: 'towers#theme', as: :theme_towers
  get 'towers/:theme_id/:id', to: 'towers#category', as: :category_towers

  get ':id', to: 'towers#show', as: :tower

end
