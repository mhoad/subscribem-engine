# frozen_string_literal: true

require_dependency 'subscribem/application_controller'

module Subscribem
  class Account
    # This is the dashboard that a user who is logged into their
    # account would see
    class DashboardController < Subscribem::Account::BaseController
      def index; end
    end
  end
end
