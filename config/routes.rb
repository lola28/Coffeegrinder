Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'dashboard', to: 'pages#dashboard'

  get 'profile', to: 'pages#show_profile'
  get 'profile/edit', to: 'pages#edit_profile'
  patch 'profile', to: 'pages#update_profile', as: 'profile_update'
  get 'coffeehouses/search'

  resources :coffeehouses do
    get 'search', to: 'coffeehouses#search', as: 'search'

    resources :check_ins, only: [:create, :edit, :update, :destroy]
  end
end
