Rails.application.routes.draw do
  

 
  resources :imagegals
  root to: 'imagegals#galleryimage'
 
  # default_url_options :host => "localhost:3000"

  devise_for :users, :controllers => {:registrations => "registrations"}
  get "/galleryimage" => "imagegals#galleryimage"
  # get 'tags/:tag', to: 'imagegals#tagged',as: :tag
  get '/tagged', to: "imagegals#tagged", as: :tagged
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
