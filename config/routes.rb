Rails.application.routes.draw do
  root to: "articles#index"

  devise_for :users
  
  #resource routes
  resources :articles do
    resources :comments
  end
end
