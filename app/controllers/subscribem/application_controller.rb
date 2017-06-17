# frozen_string_literal: true

module Subscribem
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def current_account
      nil
    end
    helper_method :current_account
  end
end
