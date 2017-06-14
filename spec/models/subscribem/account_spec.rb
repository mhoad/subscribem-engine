# frozen_string_literal: true

require 'rails_helper'

module Subscribem
  RSpec.describe Subscribem::Account, type: :model do
    it 'has a valid factory' do
      expect(build(:account)).to be_valid
    end

    # Lazily loaded to ensure it's only used when it's needed
    # RSpec tip: Try to avoid @instance_variables if possible. They're slow.
    let(:account) { build(:account) }

    describe 'ActiveModel validations' do
      it { expect(account).to validate_presence_of(:name) }
    end
  end
end
