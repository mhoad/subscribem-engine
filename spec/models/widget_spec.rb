# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Widget, type: :model do
  it 'has a valid factory' do
    expect(build(:widget)).to be_valid
  end

  # Lazily loaded to ensure it's only used when it's needed
  # RSpec tip: Try to avoid @instance_variables if possible. They're slow.
  let(:widget) { build(:widget) }

  describe 'ActiveModel validations' do
    it { expect(widget).to validate_presence_of(:name) }
  end

  describe 'Associations' do
    it { expect(widget).to belong_to(:account) }
  end
end
