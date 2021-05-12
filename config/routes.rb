Rails.application.routes.draw do
  resources :deposits
  resources :grouped_payments
  resources :groups
  get 'users/index'
  get 'users/show'
  devise_for :users, :controllers => { registrations: 'registrations'}
  root to: "users#show"
  get "/users/:id", to: "users#show", :as => :user_show
  get "/ungrouped_payments", to: "deposits#ungrouped", :as => :ungrouped_payments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
