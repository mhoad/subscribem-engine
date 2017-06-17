# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Account scoping', type: :feature do
  let!(:account_a) { FactoryGirl.create(:account) }
  let!(:account_b) { FactoryGirl.create(:account) }

  before do
    Widget.create(name: "Account A's Widget", account: account_a)
    Widget.create(name: "Account B's Widget", account: account_b)
  end

  context 'index' do
    scenario 'displays only widgets that belong to Account A' do
      set_subdomain(account_a.subdomain)
      login_as(account_a.owner)
      visit widgets_path

      expect(page).to have_content("Account A's Widget")
      expect(page).to_not have_content("Account B's Widget")
    end

    scenario 'displays only widgets that belong to Account B' do
      set_subdomain(account_b.subdomain)
      login_as(account_b.owner)
      visit widgets_path

      expect(page).to have_content("Account B's Widget")
      expect(page).to_not have_content("Account A's Widget")
    end
  end

  context 'show' do
    context "when signed in as account A's owner" do
      before do
        login_as(account_a.owner)
        set_subdomain(account_a.subdomain)
      end

      it "can see Account A's widget" do
        widget = account_a.widgets.first
        visit widget_url(widget)
        expect(page).to have_content(widget.name)
      end

      it "cannot see Account B's widget" do
        widget = account_b.widgets.first
        visit widget_url(widget)
        # byebug
        expect(page).to have_content('Widget not found.')
        expect(page.current_url).to eq(subscribem.root_url)
      end
    end
  end
end
