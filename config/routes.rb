Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   get "/", to: "welcome#index"
   get "/obituaries", to: "obituaries#index"
   namespace :obituaries do
     get 'covid-19', to: 'covid#index'
   end
end
