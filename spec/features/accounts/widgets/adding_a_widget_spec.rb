# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Adding a widget', type: :feature do
  let(:account) { FactoryGirl.create(:account) }

  before do
    set_subdomain(account.subdomain)
  end

  context 'As a logged in account owner' do
    before do
      login_as(account.owner)
      visit new_widget_url
    end

    scenario 'Adds a widget successfully' do
      fill_in 'Name', with: 'My Fancy Widget'
      click_button 'Create Widget'
      expect(page).to have_content('Widget was successfully created.')
      expect(page).to have_content('My Fancy Widget')
      expect(page.current_url).to eq(widget_url(Widget.first))
    end
  end

  context 'As a regular account user' do
    let(:user) { FactoryGirl.create(:user) }

    before do
      account.users << user
      login_as(user)
      visit new_widget_url
    end

    scenario 'Adds a widget successfully' do
      fill_in 'Name', with: 'My Fancy Widget'
      click_button 'Create Widget'
      expect(page).to have_content('Widget was successfully created.')
      expect(page).to have_content('My Fancy Widget')
      expect(page.current_url).to eq(widget_url(Widget.first))
    end
  end

  context 'As an unauthorized user' do
    let(:user) { FactoryGirl.create(:user) }

    before do
      login_as(user)
      visit new_widget_url
    end

    scenario 'Is not able to add a widget' do
      sign_in_message = 'You are not permitted to view that account.'
      expect(page).to have_content(sign_in_message)
      expect(page.current_url).to eq(subscribem.root_url(subdomain: nil))
    end
  end

  context 'When not signed in as a user' do
    before do
      visit new_widget_url
    end

    scenario 'Is not able to add a widget' do
      sign_in_message = 'You need to sign in or sign up before continuing.'
      expect(page).to have_content(sign_in_message)
      expect(page.current_url).to eq(subscribem.new_user_session_url)
    end
  end
end
