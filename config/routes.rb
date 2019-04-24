Rails.application.routes.draw do

  devise_for :users
  namespace :api, default: {format: :json} do
    resources :memos, only: %i[create]
  end

  resources :memos
  resources :users
end
