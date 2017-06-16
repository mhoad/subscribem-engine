# frozen_string_literal: true

require 'rails_helper'

module Subscribem
  RSpec.describe Membership, type: :model do
    it 'has a valid factory' do
      expect(build(:membership)).to be_valid
    end

    # Lazily loaded to ensure it's only used when it's needed
    # RSpec tip: Try to avoid @instance_variables if possible. They're slow.
    let(:membership) { build(:membership) }

    describe 'Associations' do
      it { expect(membership).to belong_to(:account) }
      it { expect(membership).to belong_to(:user) }
    end
  end
end
