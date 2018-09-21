Rails.application.routes.draw do
  
  devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'create_new_splitter' }
  
  root 'slides#index'
  
  resources :announcements
  resources :clogos
  resources :announcements do
    post :update_row_order, on: :collection
    collection {post :import}
  end
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
  resources :slides, :path => "news"
  resources :releases do
    post :update_row_order, on: :collection
    collection {post :import}
  end
  resources :customs, :path => "composition"
  resources :customs do
    post :update_row_order, on: :collection
    collection {post :import}
  end
  resources :researches, :path => "researchlondon"
  resources :researches do
    post :update_row_order, on: :collection
    collection {post :import}
  end
  resources :contacts, :path => "contact"
  resources :share_closes
  resources :newsletters
  resources :showreels
  resources :showreels do
    post :update_row_order, on: :collection
    collection {post :import}
  end
  resources :customvideos
  
  match "admins/artists" => "admins#artists", via: [:get, :post]
  match "admins/customs" => "admins#customs", via: [:get, :post]
  match "admins/placements" => "admins#placements", via: [:get, :post]
  match "admins/releases" => "admins#releases", via: [:get, :post]
  match "admins/customs" => "admins#customs", via: [:get, :post]
  match "admins/researches" => "admins#researches", via: [:get, :post]
  match "admins/slideshow" => "admins#slideshow", via: [:get, :post]
  match "admins/announcements" => "admins#announcements", via: [:get, :post]
  match "admins/newsletter" => "admins#newsletter", via: [:get, :post]
  match "admins/showreel" => "admins#showreel", via: [:get, :post]
  match "compositions/showreel" => "customs#showreel", via: [:get, :post]
  
end