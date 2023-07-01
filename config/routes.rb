Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'
  resources :users, only: [:index, :show, :edit, :update]
  resources :comics, only: [:index, :show, :edit, :update, :create, :new, :destroy] do 
    resources :post_comments, only: [:create, :destroy]
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
