# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Accounts', type: :feature do
  scenario 'creating an account' do
    visit subscribem.root_url
    click_link 'Account Sign Up'
    fill_in 'Name', with: 'Test'
    fill_in 'Subdomain', with: 'test'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password', exact: true
    fill_in 'Password confirmation', with: 'password'
    click_button 'Create Account'

    expect(page).to have_content('Signed in as test@example.com')
    # expect(page.current_url).to eq(root_url(subdomain: 'test'))
    expect(page.current_url).to eq('http://test.example.com/subscribem/')

    within('.alert') do
      success_message = 'Your account has been successfully created.'
      expect(page).to have_content(success_message)
    end
  end
end
