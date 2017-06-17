# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Editing a widget', type: :feature do
  let(:widget) { FactoryGirl.create(:widget) }

  before do
    set_subdomain(widget.account.subdomain)
  end

  context 'As a logged in account owner' do
    before do
      login_as(widget.account.owner)
      visit edit_widget_url(widget)
    end

    scenario 'Can edit a widget successfully' do
      fill_in 'Name', with: 'My Fancy New Widget'
      click_button 'Update Widget'
      expect(page).to have_content('Successfully updated widget.')
      expect(page).to have_content('My Fancy New Widget')
      expect(page).to_not have_content(widget.name)
      expect(page.current_url).to eq(widget_url(widget))
    end
  end

  context 'As a regular account user' do
    let(:user) { FactoryGirl.create(:user) }

    before do
      widget.account.users << user
      login_as(user)
      visit edit_widget_url(widget)
    end

    scenario 'Can edit a widget successfully' do
      fill_in 'Name', with: 'My Fancy New Widget'
      click_button 'Update Widget'
      expect(page).to have_content('Successfully updated widget.')
      expect(page).to have_content('My Fancy New Widget')
      expect(page).to_not have_content(widget.name)
      expect(page.current_url).to eq(widget_url(widget))
    end
  end

  context 'As an unauthorized user' do
    let(:user) { FactoryGirl.create(:user) }

    before do
      login_as(user)
      visit edit_widget_url(widget)
    end

    scenario 'Is not able to add a widget' do
      sign_in_message = 'You are not permitted to view that account.'
      expect(page).to have_content(sign_in_message)
      expect(page.current_url).to eq(subscribem.root_url(subdomain: nil))
    end
  end

  context 'When not signed in as a user' do
    before do
      visit edit_widget_url(widget)
    end

    scenario 'Is not able to add a widget' do
      sign_in_message = 'You need to sign in or sign up before continuing.'
      expect(page).to have_content(sign_in_message)
      expect(page.current_url).to eq(subscribem.new_user_session_url)
    end
  end
end
