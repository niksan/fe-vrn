FeVrn::Application.routes.draw do


  mount Rich::Engine => '/rich', :as => 'rich'

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  root to: 'main#index'

  resources :categories, only: [:show] do
    resources :products, only: [:show]
  end

  post 'cart_items/:id', to: "cart_items#create", as: 'cart_items'

end
