require "sidekiq/web"
Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  resources :funcionarios
   root "funcionarios#index"
  devise_for :users
end
