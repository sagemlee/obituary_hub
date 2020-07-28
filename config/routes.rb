Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    get "/", to: "welcome#index"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    get "/auth/facebook/callback", to: "facebook#create"
    get "/auth/google_oauth2/callback", to: "google#create"
    delete "/logout", to: "sessions#destroy"
    get '/profile', to: "users#show"
   resources :users, only: [:new, :create]
   namespace :obituaries do
     get 'covid-19', to: 'covid#index'
     get 'recent', to: 'recent#index'
     get 'community', to: 'community#index'
   end
   resources :obituaries
   get '/search', to: 'search#index'
   namespace :search do
     get 'advanced', to: 'advanced#index'
   end
   get '/resources', to: 'resources#index'

end
