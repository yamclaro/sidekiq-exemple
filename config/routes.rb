Rails.application.routes.draw do
  resources :funcionarios
   root "funcionarios#index"
  devise_for :users
end
