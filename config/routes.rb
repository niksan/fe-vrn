FeVrn::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  root to: 'main#index'

  resources :categories, only: [:show]
end
