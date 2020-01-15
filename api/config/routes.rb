Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'

  namespace :api, format: 'json' do
    namespace :v1 do
      resources :posts
    end
  end
end