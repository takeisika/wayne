Rails.application.routes.draw do



  post "likecomments/:comment_id/create"=>"likecomments#create"
  post "likecomments/:comment_id/destroy"=>"likecomments#destroy"


  get "posts/search_form"=>"posts#search_form"
  get "users/guest_form"=>"users#guest_form"
  post "users/guest"=>"users#guest"

  
  get 'hashtags/show'
  get "follows/index"=>"follows#index"
  post 'follows/:followed_id/create'=>"follows#create"
  post 'follows/:followed_id/destroy'=>"follows#destroy"
  


  get "hashtags/:id"=>"hashtags#show"


  post "talks/:your_id/create"=>"talks#create"
  get "talks/:your_id"=>"talks#show"




  post "logout"=>"users#logout"
  post "likes/:post_id/create"=>"likes#create"
  post "likes/:post_id/destroy"=>"likes#destroy"
  
  get 'likes/create'

  get "home/about"=>"home#about"


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
  post "posts/:id/destroy_at_comment"=>"posts#destroy_at_comment"
  get "posts/:id"=>"posts#show"
  get "posts/:id/comment"=>"posts#comment"
  post "posts/:id/come"=>"posts#come"
  



  get "comments/:id/edit"=>"comments#edit"
  post "comments/:id/update"=>"comments#update"
  post "comments/:id/destroy"=>"comments#destroy"
  
  

  get 'home/top'
  get "/"=>"posts#index"
  resources :users
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
