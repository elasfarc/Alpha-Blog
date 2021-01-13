Rails.application.routes.draw do
  root "pages#home"
  get "about", to:"pages#about"
  resources :articles, only:[:index, :new, :create, :show, :edit, :update, :destroy]
  resources :users
end
