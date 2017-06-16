# frozen_string_literal: true

require 'rails_helper'

module Subscribem
  RSpec.describe Invitation, type: :model do
    it 'has a valid factory' do
      expect(build(:invitation)).to be_valid
    end

    # Lazily loaded to ensure it's only used when it's needed
    # RSpec tip: Try to avoid @instance_variables if possible. They're slow.
    let(:invitation) { build(:invitation) }

    describe 'ActiveModel validations' do
      it { expect(invitation).to validate_presence_of(:email) }
      it 'should accept valid emails' do
        emails = %w[user@gmail.com user@email.com.au user.name@domain.ca]
        emails.each do |valid_email|
          expect(invitation).to allow_value(valid_email).for(:email)
        end
      end
      it 'should reject invalid emails' do
        emails = %w[user@gmail @email.com.au *@domain.ca notanemail]
        emails.each do |invalid_email|
          expect(invitation).to_not allow_value(invalid_email).for(:email)
        end
      end
    end

    describe 'Associations' do
      it { expect(invitation).to belong_to(:account) }
    end

    describe 'Functionality' do
      it 'generates a unique token' do
        invitation.save # We have only built it so far
        expect(invitation.token).to be_present
      end
    end
  end
end
