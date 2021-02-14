Rails.application.routes.draw do
  
  get "posts/_form"=>"posts#_form"
  get "posts/index"=>"posts#index"
  post "posts/create"=>"posts#create"
  get "posts/:id/edit"=>"posts#edit"
  post "posts/:id/update"=>"posts#update"
  post "posts/:id/destroy"=>"posts#destroy"
  get "posts/:id"=>"posts#show"
  

  get 'home/top'
  get "/"=>"posts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
