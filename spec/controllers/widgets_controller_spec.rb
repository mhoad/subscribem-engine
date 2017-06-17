# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WidgetsController, type: :controller do
  # describe 'GET #new' do
  #   before do
  #     get :new
  #   end

  #   it 'returns the correct response code' do
  #     expect(response).to have_http_status(:success) # 200
  #   end

  #   it 'returns the correct content-type' do
  #     expect(response.headers['Content-Type']).to eq 'text/html; charset=utf-8'
  #   end
  # end

  # describe 'POST #create' do
  #   let(:account) { create(:account) }

  #   before do
  #     sign_in(account.owner)
  #     widget_params = { widget: FactoryGirl.attributes_for(:widget) }
  #     @request.host = "#{account.subdomain}.example.com"
  #     post :create, params: widget_params
  #   end

  #   it 'displays the correct flash message' do
  #     expect(flash[:notice]).to eq 'Widget was successfully created.'
  #   end

  #   it 'creates an account' do
  #     expect(Widget.count).to eq(1)
  #   end

  #   it 'redirects to the correct page' do
  #     expect(response).to redirect_to widget_path(Widget.first)
  #   end
  # end
end
