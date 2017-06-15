# frozen_string_literal: true

module Subscribem
  class Account < ApplicationRecord
    validates :name, presence: true, length: { minimum: 2, maximum: 100 }

    belongs_to :owner, class_name: 'Subscribem::User'
    accepts_nested_attributes_for :owner
  end
end
