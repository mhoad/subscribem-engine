# frozen_string_literal: true

module Subscribem
  class Account < ApplicationRecord
    validates :name, presence: true
  end
end
