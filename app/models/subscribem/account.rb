# frozen_string_literal: true

# == Schema Information
#
# Table name: subscribem_accounts
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#  subdomain  :string
#
module Subscribem
  class Account < ApplicationRecord
    validates :name, presence: true, length: { minimum: 2, maximum: 100 }
    validates :subdomain, presence: true, uniqueness: true

    belongs_to :owner, class_name: 'Subscribem::User'
    has_many :invitations, class_name: 'Subscribem::Invitation'
    has_many :memberships, class_name: 'Subscribem::Membership'
    has_many :users, through: :memberships

    accepts_nested_attributes_for :owner
  end
end
