Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }
  root "application#homepage"

  resources :videos, only: [:new, :create, :show]
end
