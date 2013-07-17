FeVrn::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  root to: 'main#index'

  resources :categories, only: [:show] do
    resources :products, only: [:show]
  end

  namespace :cart do
    post 'items/:id', to: "items#create", as: 'items'
  end

  resources :cart, only: [:index]
  
end
