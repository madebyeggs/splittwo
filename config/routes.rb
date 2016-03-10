Rails.application.routes.draw do
  
  devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'create_new_splitter' }
  
  root 'announcements#index'
  resources :announcements
  resources :artists
  resources :admins, :path => "admin"
  
end