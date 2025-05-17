Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: "homes#top"
  get 'home/about', to: 'homes#about', as: :about
  resources :reviews, only: [:new, :create, :show]
  resources :users, only: [:show, :edit, :update] do
    member do
      get 'mypage'
      get 'bookmark', action: :index
    end
  end
  get 'users/confirm'
  patch 'users/quit'
end
