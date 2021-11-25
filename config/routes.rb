Rails.application.routes.draw do
  root to: "posts#index"
  get 'posts/index'  
  # get 'posts/new', to: "posts#new"
  # get 'posts/:id', to: "posts#show"
  # get 'posts/create', to: "posts#create"
  # get 'posts/:id/edit', to: "posts#edit"
  # get 'posts/:id/update', to: "posts#update"
  resources :posts
 
end
