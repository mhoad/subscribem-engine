# frozen_string_literal: true

# == Schema Information
#
# Table name: subscribem_users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'rails_helper'

module Subscribem
  RSpec.describe Subscribem::User, type: :model do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end

    # Lazily loaded to ensure it's only used when it's needed
    # RSpec tip: Try to avoid @instance_variables if possible. They're slow.
    let(:user) { build(:user) }

    describe 'ActiveModel validations' do
      it { expect(user).to validate_presence_of(:email) }
      it { expect(user).to validate_presence_of(:password) }
      it { expect(user).to validate_length_of(:password).is_at_least(6).is_at_most(128) }
    end
  end
end
