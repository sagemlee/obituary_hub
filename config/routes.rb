Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   get "/", to: "welcome#index"


   get '/profile', to: "users#show"
   resources :users, only: [:new, :create]


   get "/login", to: redirect("/auth/google_oauth2")
   get "/logout", to: "sessions#destroy"
   get "/auth/google_oauth2/callback", to: "sessions#create"
   

end
