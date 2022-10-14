Rails.application.routes.draw do
  root 'articles#index'
  get 'about', to: "home#about"

  resources :articles, except: [:new]

  post "/upload_file", to: "upload#upload_file", as: :upload_file
  get "/download_file/:name", to: "upload#access_file", as: :upload_access_file, name: /.*/
end
