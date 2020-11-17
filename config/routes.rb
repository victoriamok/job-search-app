Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  #mount ActionCable.server => '/cable'
  
  root to: 'search#new'
  post '/search', to: 'search#index'
end
