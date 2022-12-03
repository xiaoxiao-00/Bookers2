Rails.application.routes.draw do
  root to:"homes#top"
  get "/home/about" => "homes#about", as:"about"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :edit, :update, :index]

end
