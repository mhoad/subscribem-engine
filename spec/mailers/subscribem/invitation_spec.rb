# frozen_string_literal: true

require 'rails_helper'

module Subscribem
  RSpec.describe InvitationMailer, type: :mailer do
    describe 'invite' do
      let(:invitation) { FactoryGirl.create(:invitation) }

      before do
        @mail = Subscribem::InvitationMailer.invite(invitation)
      end

      context 'headers' do
        it 'renders the subject' do
          expect(@mail.subject).to eq(
            "You have been invited to the #{invitation.account.name} account"
          )
        end

        it 'sends the right email' do
          expect(@mail.to).to eq [invitation.email]
        end

        it 'renders the from email' do
          expect(@mail.from).to eq ['from@example.com']
        end
      end
    end
  end
end
