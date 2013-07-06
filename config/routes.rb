FeVrn::Application.routes.draw do

  get "products/show"

  mount Rich::Engine => '/rich', :as => 'rich'

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  root to: 'main#index'

  resources :categories, :products, only: [:show]
end
