# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Subscribem::Accounts', type: :feature do
  scenario 'creating an account' do
    set_default_host
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
    expect(page.current_url).to eq('http://test.example.com/')

    within('.alert') do
      success_message = 'Your account has been successfully created.'
      expect(page).to have_content(success_message)
    end
  end

  scenario 'ensure subdomain uniqueness' do
    owner = Subscribem::User.create!(email: 'owner@example.com',
                                     password: 'password')
    Subscribem::Account.create!(subdomain: 'test', name: 'test', owner: owner)

    visit subscribem.root_path
    click_link 'Account Sign Up'
    fill_in 'Name', with: 'Test'
    fill_in 'Subdomain', with: 'test'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password', exact: true
    fill_in 'Password confirmation', with: 'password'
    click_button 'Create Account'

    expect(page.current_url).to eq('http://example.com/accounts')
    expect(page).to have_content('Subdomain has already been taken')

    within('.alert') do
      error_message = 'Sorry, your account could not be created.'
      expect(page).to have_content(error_message)
    end
  end
end
