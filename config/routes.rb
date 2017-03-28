Rails.application.routes.draw do
  devise_for :users
  root 'teddies#index'
  resources :teddies, only: [:index, :show]
  resources :orders, only: [:show, :create] do
    resource :payment, only: [:show]
  end
  post 'wx_notify', to: 'payments#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
