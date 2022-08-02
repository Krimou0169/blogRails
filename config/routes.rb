Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "articles#index"
  # Defines the root path route ("/")
  # root "articles#index"
  # get "/articles", to: "articles#index"
  # Defines the root path route ("/") with an article's id (parameter)
  # get "/articles/:id", to: "articles#show"

  #replace the two get routes with ressources
  resources :articles do
    resources :comments
  end
end


