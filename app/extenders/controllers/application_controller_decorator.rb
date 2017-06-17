# frozen_string_literal: true

::ApplicationController.class_eval do
  # def current_account
  #   nil
  # end
  # helper_method :current_account

  def current_account
    @current_account ||= Subscribem::Account.find_by!(subdomain: request.subdomain)
  end
  helper_method :current_account
end
