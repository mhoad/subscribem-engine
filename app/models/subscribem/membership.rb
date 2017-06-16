# frozen_string_literal: true

# == Schema Information
#
# Table name: subscribem_memberships
#
#  id         :integer          not null, primary key
#  account_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

module Subscribem
  class Membership < ApplicationRecord
    belongs_to :account, class_name: 'Subscribem::Account'
    belongs_to :user, class_name: 'Subscribem::User'
  end
end
