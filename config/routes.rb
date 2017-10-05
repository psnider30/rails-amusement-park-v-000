Rails.application.routes.draw do

  get 'rides/new'

root 'welcome#home'

resources :users
resources :attractions
resources :rides, only: [:create]

get '/signin' => 'sessions#new'
post '/signin' => 'sessions#create'
delete '/signout' => 'sessions#destroy'

end
