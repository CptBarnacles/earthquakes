Rails.application.routes.draw do
  get 'earth_quake_finder/index'
  get 'earthquakes/index'
  root 'earthquakes#index'
  resources :bigquakes
  resources :earthquakes
  resources :feed
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
