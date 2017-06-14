# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Accounts', type: :feature do
  scenario 'creating an account' do
    visit subscribem.root_url
    click_link 'Account Sign Up'
    fill_in 'Name', with: 'Test'
    click_button 'Create Account'

    within('.alert') do
      success_message = 'Your account has been successfully created.'
      expect(page).to have_content(success_message)
    end
  end
end
