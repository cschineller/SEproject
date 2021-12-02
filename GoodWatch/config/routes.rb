Rails.application.routes.draw do
  #get 'reviews/create'
  post '/products/:id/reviews', to 'reviews#create', as: :create_review
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :shows #[:index, :show, :new, :edit, :create, :update, :destroy]
  root to: 'shows#index'

  #CRUD routes linking HTML path to shows_controller
  # get '/shows', to: 'shows#index'
  # get '/shows/:id', to: 'shows#show'
  # get '/shows/new', to:'shows#new'
  # get '/shows/edit', to: 'shows#edit'
  # post '/shows', to: 'shows#create'
  # patch '/shows/:id', to: 'shows#update'
  # delete '/shows/:id', to: '/shows#destroy'

end