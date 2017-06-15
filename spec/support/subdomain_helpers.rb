# frozen_string_literal: true

# module SubdomainHelpers
#   def within_account_subdomain
#     let(:subdomain_url) { "http://#{account.subdomain}.example.com" }
#     before { Capybara.default_host = subdomain_url }
#     after { Capybara.default_host = 'http://www.example.com' }
#   end
# end

# RSpec.configure do |config|
#   config.include SubdomainHelpers, type: :feature
#   config.before type: :feature do
#     Capybara.app_host = 'http://lvh.me'
#   end
# end

module SubdomainHelpers
  def set_subdomain(subdomain)
    site = "#{subdomain}.example.com"
    Capybara.app_host = "http://#{site}"
    Capybara.always_include_port = true
    default_url_options[:host] = site.to_s
  end

  def set_default_host
    Capybara.app_host = 'http://example.com'
    Capybara.always_include_port = true
    default_url_options[:host] = 'example.com'

    if Capybara.current_session.server
      port = Capybara.current_session.server.port
      default_url_options[:port] = port
    end
  end
end

RSpec.configure do |config|
  config.include SubdomainHelpers, type: :feature
  config.before type: :feature do
    Capybara.app_host = 'http://example.com'
  end
end
