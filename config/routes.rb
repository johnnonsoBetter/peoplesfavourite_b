Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'

      resources :favourite_things, only: [:create, :index, :show, :destroy]
      resources :favourite_thing_types, only: [:create, :destroy]
    end

  end

end
