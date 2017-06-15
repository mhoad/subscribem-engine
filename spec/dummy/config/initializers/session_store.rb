# frozen_string_literal: true

options = {
  key: '_dummy_session',
  domain: 'example.com'
}

Rails.application.config.session_store :cookie_store, options
