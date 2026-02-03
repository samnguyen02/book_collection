# frozen_string_literal: true

Rails.application.routes.draw do
  resources :user_books
  resources :users
  resources :books do
    member do
      get 'delete'
    end
  end
  resources :authors

  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'user_books#index'
end
