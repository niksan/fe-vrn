FeVrn::Application.routes.draw do

  post "feedback", to: 'feedback#create', as: 'feedback_create'
  get "pages/show"

  mount Ckeditor::Engine => '/ckeditor'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  root to: 'main#index'

  resources :categories, only: :show do
    resources :products, only: :show
  end

  namespace :cart do
    post 'items/:id', to: "items#create", as: 'items'
  end

  get 'cart' => 'cart#index', as: 'cart_index'
  put 'cart' => 'cart#update', as: 'cart'

  resources :orders, only: [:new, :create]
  resources :articles, :pages, only: :show
  resources :yandex_market, :sitemap, :contacts, only: :index

end
