# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Inviting users', type: :feature do
  let(:account) { FactoryGirl.create(:account) }

  before do
    set_subdomain(account.subdomain)
    login_as(account.owner)
    visit subscribem.root_url
  end

  scenario 'invites a user successfully' do
    click_link 'Users'
    click_link 'Invite User'
    fill_in 'Email', with: 'test@example.com'
    click_button 'Invite User'
    expect(page).to have_content('test@example.com has been invited.')
    expect(page.current_url).to eq(subscribem.root_url)
    email = find_email('test@example.com')
    expect(email).to be_present
    expect(email.subject).to eq("You have been invited to the #{account.name} account")
  end
end
