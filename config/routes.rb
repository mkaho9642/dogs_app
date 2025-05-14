Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: "homes#top"
  get 'home/about', to: 'homes#about', as: :about
  resources :reviews, only: [:new, :create, :show]
  resources :users, only: [:mypage, :show, :edit]
end
