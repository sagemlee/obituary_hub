Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   get "/", to: "welcome#index"
   get "/login", to: "sessions#new"
   post "/login", to: "sessions#create"
   get "/logout", to: "sessions#index"
   get '/profile', to: "users#show"
   resources :users, only: [:new, :create] do
     resources :covid, only: :index, as: "covid", controller: "users/covid"
   end

end
