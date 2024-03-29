# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  let(:account) { FactoryGirl.create(:account) }
  let(:user) { FactoryGirl.create(:user) }

  before do
    set_subdomain(account.subdomain)
    account.users << user
  end

  context 'as an account owner' do
    before { login_as(account.owner) }

    scenario 'it can remove a user' do
      visit subscribem.root_url
      click_link 'Users'
      within('#users') do
        expect(page).to have_content(account.owner.email)
        expect(page).to have_content(user.email)
      end

      click_link 'Remove'

      within('.alert') do
        expect(page).to have_content("#{user.email} has been removed from this account.")
      end

      expect(account.reload.users).to be_empty
    end
  end

  context 'as an account user' do
    before { login_as(user) }

    scenario 'it does not see the users link' do
      visit subscribem.root_url
      expect { find_link('Users') }.to raise_error(Capybara::ElementNotFound)
    end

    scenario 'cannot go to the users page' do
      visit subscribem.users_path
      within('.alert') do
        expect(page).to have_content('Only an owner of an account can do that.')
      end
    end
  end
end
