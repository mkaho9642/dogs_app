Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :salons, only: [:index, :show, :edit]
    resources :users, only: [:index, :show, :edit]
    resources :genres, only: [:index, :edit]
    resources :reviews, only: [:index, :edit]
  end

  devise_for :users
  root to: "homes#top"
  get 'home/about', to: 'homes#about', as: :about
  resources :reviews, only: [:new, :create, :show]

  get 'users/confirm'
  patch 'users/quit'
  
  resources :users, only: [:show, :edit, :update] do
    member do
      get 'mypage'
      get 'bookmark', action: :index
    end
  end
end
