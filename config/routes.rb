Rails.application.routes.draw do
  namespace :api, default: {format: :json} do
    resources :memos, only: :create
  end
end
