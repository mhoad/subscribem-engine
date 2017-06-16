# frozen_string_literal: true

FactoryGirl.define do
  factory :membership, class: Subscribem::Membership do
    user
    account
  end
end
