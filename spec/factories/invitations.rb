# frozen_string_literal: true

FactoryGirl.define do
  factory :invitation, class: Subscribem::Invitation do
    email { Faker::Internet.email }
    account
  end
end
