# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root to: 'url_shorteners#index'

  #post 'url_shorteners/create'
  #get '/show_short_url/:short_url', to: 'url_shorteners#show_short_url', as: :show_short_url
  #get '/url_shorteners/find_original_url'
  get '/:short_url', to: 'url_shorteners#find_original_url'
  #get 'url_shorteners/list_top_100'

  namespace :api do 
    namespace :v1 do 
     resources :url_shorteners, only: [:index, :create]
    end 
  end

  root to: 'home#index'
end
