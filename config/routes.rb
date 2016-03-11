Rails.application.routes.draw do
  
  devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'create_new_splitter' }
  
  root 'announcements#index'
  resources :announcements
  resources :artists
  resources :artists do
    post :update_row_order, on: :collection
    collection {post :import}
  end
  resources :admins, :path => "admin"
  resources :works, :path => "placements"
  resources :works do
    post :update_row_order, on: :collection
    collection {post :import}
  end
  resources :releases
  resources :releases do
    post :update_row_order, on: :collection
    collection {post :import}
  end
  
  match "admins/artists" => "admins#artists", via: [:get, :post]
  match "admins/placements" => "admins#placements", via: [:get, :post]
  match "admins/releases" => "admins#releases", via: [:get, :post]
  
end