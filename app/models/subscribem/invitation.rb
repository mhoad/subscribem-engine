# frozen_string_literal: true

# == Schema Information
#
# Table name: subscribem_invitations
#
#  id         :integer          not null, primary key
#  email      :string
#  account_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  token      :string
#

module Subscribem
  class Invitation < ApplicationRecord
    belongs_to :account, class_name: 'Subscribem::Account'

    before_create :generate_token

    validates :email, presence: true
    validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/,
                                message: 'Email must be valid' }

    # We want to use the token as the ID for ActiveRecord lookups
    def to_param
      token
    end

    private

    def generate_token
      self.token = SecureRandom.hex(16)
    end
  end
end
