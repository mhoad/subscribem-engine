# frozen_string_literal: true

FactoryGirl.define do
  factory :account, class: Subscribem::Account do
    name { Faker::Company.name }
  end
end
