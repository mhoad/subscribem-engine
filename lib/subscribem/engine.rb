# frozen_string_literal: true

require 'devise'

module Subscribem
  class Engine < ::Rails::Engine
    isolate_namespace Subscribem

    config.generators do |g|
      g.test_framework :rspec, view_specs: false
    end

    APPLICATION_NAME = 'My SaaS'
  end
end
