Rails.application.routes.draw do
  devise_for :users
  namespace :api, default: {format: :json} do
    resources :memos, only: :create
  end
end
