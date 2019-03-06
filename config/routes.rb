Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'url_shorteners#index'
  get 'url_shorteners/index'
  get 'url_shortener/index'

  post "url_shorteners/create"
  get "/show_short_url/:short_url", to: "url_shorteners#show_short_url", as: :show_short_url
  get "/url_shorteners/get_original_url"
  get "/:short_url", to: "url_shorteners#get_original_url"
end

