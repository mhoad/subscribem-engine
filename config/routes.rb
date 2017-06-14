# frozen_string_literal: true

Subscribem::Engine.routes.draw do
  root to: 'dashboard#index'
  get '/accounts/new', to: 'accounts#new', as: :new_account
  post '/accounts', to: 'accounts#create', as: :accounts
end
