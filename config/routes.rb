Rails.application.routes.draw do

  root to: "searches/request#index"
  namespace :searches do
    resources :request
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end