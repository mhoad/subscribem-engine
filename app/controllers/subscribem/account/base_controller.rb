# frozen_string_literal: true

require_dependency 'subscribem/application_controller'

module Subscribem
  class Account
    # This is the controller from which other account controllers inherit
    # much of their functionality from. It captures common functionality
    # across these various controllers
    class BaseController < Subscribem::ApplicationController
      before_action :authenticate_user!

      def current_account
        @current_account ||= Subscribem::Account.find_by!(subdomain: request.subdomain)
      end
      helper_method :current_account

      def owner?
        current_account.owner == current_user
      end
      helper_method :owner?

    end
  end
end
