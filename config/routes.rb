Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   get "/", to: "welcome#index"

   get '/profile', to: "users#show"
   resources :users, only: [:new, :create]
   resources :obituaries, only: [:new]
   get "/obituaries", to: "obituaries#index"
   namespace :obituaries do
     get 'covid-19', to: 'covid#index'
     get 'recent', to: 'recent#index'
   end
   get '/search', to: 'search#index'
   namespace :search do
     get 'advanced', to: 'advanced#index'
   end
end
