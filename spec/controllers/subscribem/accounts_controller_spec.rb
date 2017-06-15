# frozen_string_literal: true

require 'rails_helper'

module Subscribem
  RSpec.describe Subscribem::AccountsController, type: :controller do
    routes { Subscribem::Engine.routes }

    describe 'GET #new' do
      it 'returns the correct response code' do
        get :new
        expect(response).to have_http_status(:success) # 200
      end
    end

    describe 'POST #create' do
      # The following test seems to not work due to a bug in Rails 5
      # Details: https://github.com/rails/rails/issues/23997
      # context 'With valid information' do
      #   before do
      #     account_params = { account: FactoryGirl.attributes_for(:account) }
      #     post :create, params: account_params
      #   end

      #   it 'displays the correct flash message' do
      #     expect(flash[:notice]).to eq 'Your account has been successfully created.'
      #   end

      #   it 'creates an account' do
      #     expect(Subscribem::Account.count).to eq(1)
      #   end

      #   it 'redirects to the correct page' do
      #     expect(response).to redirect_to root_path
      #   end
      # end
    end
  end
end
