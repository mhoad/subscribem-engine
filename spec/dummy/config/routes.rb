# frozen_string_literal: true

Rails.application.routes.draw do
  mount Subscribem::Engine => '/'
  resources :widgets
end
