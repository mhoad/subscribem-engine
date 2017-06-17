# frozen_string_literal: true

class Widget < ApplicationRecord
  scoped_to_account
  validates :name, presence: true
end
