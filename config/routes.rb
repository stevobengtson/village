# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  resources :admin, only: [:index]
  namespace :admin do
    resources :user, only: %i[index edit update], concerns: :paginatable
  end
  resources :switch_user, only: %i[create destroy]
end
