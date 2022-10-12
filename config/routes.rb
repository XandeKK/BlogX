Rails.application.routes.draw do
  root 'home#index'
  get 'about', to: "home#about"

  resources :articles, except: [:new]
end
