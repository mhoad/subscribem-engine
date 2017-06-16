# frozen_string_literal: true

module Subscribem
  class Account < ApplicationRecord
    validates :name, presence: true, length: { minimum: 2, maximum: 100 }
    validates :subdomain, presence: true, uniqueness: true

    belongs_to :owner, class_name: 'Subscribem::User'
    has_many :invitations, class_name: 'Subscribem::Invitation'
    has_many :memberships
    has_many :users, through: :memberships

    accepts_nested_attributes_for :owner
  end
end
