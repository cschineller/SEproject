Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :shows, only: [:index, :show, :new, :create]
  root 'shows#index'
  devise_for :users
end
