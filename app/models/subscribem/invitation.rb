# frozen_string_literal: true

module Subscribem
  class Invitation < ApplicationRecord
    belongs_to :account, class_name: 'Subscribem::Account'

    validates :email, presence: true
    validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/,
                                message: 'Email must be valid' }
  end
end
