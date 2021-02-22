Rails.application.routes.draw do
 
  post "logout"=>"users#logout"
  post "likes/:post_id/create"=>"likes#create"
  post "likes/:post_id/destroy"=>"likes#destroy"
  
  get 'likes/create'


  get 'users/index'=>"users#index"
  get "users/new"=>"users#new"
  post "users/create"=>"users#create"
  get "users/login_form" =>"users#login_form"
  post "users/login"=>"users#login"
  get "users/:id"=>"users#show"
  get "users/:id/likes"=>"users#likes"
  get "users/:id/edit"=>"users#edit"
  post "users/:id/update"=>"users#update"

  get "posts/_form"=>"posts#_form"
  get "posts/index"=>"posts#index"
  post "posts/create"=>"posts#create"
  get "posts/:id/edit"=>"posts#edit"
  post "posts/:id/update"=>"posts#update"
  post "posts/:id/destroy"=>"posts#destroy"
  get "posts/:id"=>"posts#show"
  
  

  get 'home/top'
  get "/"=>"home#top"
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
