Rails.application.routes.draw do
  get 'memos/index'
  get 'memos/show'
  get 'memos/new'
  get 'memos/create'
  get 'memos/edit'
  get 'memos/update'
  get 'memos/destroy'
  devise_for :users
  namespace :api, default: {format: :json} do
    resources :memos, only: :create
  end
end
