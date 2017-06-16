# frozen_string_literal: true

FactoryGirl.define do
  factory :invitation, class: Subscribem::Invitation do
    email 'user@example.com'
    account
  end
end
