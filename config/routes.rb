Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :songs, only: [:index]
  post 'songs/upload', to: 'songs#upload'

  resources :artists, only: [:index]
  post 'artists/upload', to: 'artists#upload'

end
