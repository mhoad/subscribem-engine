# frozen_string_literal: true

require 'constraints/subdomain_required'

Subscribem::Engine.routes.draw do
  devise_for :users, class_name: 'Subscribem::User', module: :devise

  constraints(Subscribem::Constraints::SubdomainRequired) do
    scope module: 'account' do
      root to: 'dashboard#index', as: :account_root
      resources :invitations, only: %i[new create]
    end
  end
  root to: 'dashboard#index'
  get '/accounts/new', to: 'accounts#new', as: :new_account
  post '/accounts', to: 'accounts#create', as: :accounts
end
