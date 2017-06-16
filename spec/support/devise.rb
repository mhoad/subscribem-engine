# frozen_string_literal: true

RSpec.configure do |config|
  config.include Warden::Test::Helpers
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view
  config.include Devise::Test::IntegrationHelpers, type: :feature
end

RSpec.configure do |config|
  config.after :each do
    Warden.test_reset!
  end
end
