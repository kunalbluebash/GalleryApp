Rails.application.routes.draw do
  

 
  resources :imagegals
  root to: 'imagegals#galleryimage'
 
  # default_url_options :host => "localhost:3000"

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get "/galleryimage" => "imagegals#galleryimage"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
