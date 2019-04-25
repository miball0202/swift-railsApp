Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: "sessions" }
  namespace :api, default: {format: :json} do
    resources :memos, only: %i[create]
  end

  resources :memos
  resources :authentication_token, only: %i[update destroy]
end
