# frozen_string_literal: true

require_dependency 'subscribem/application_controller'

module Subscribem
  class Account
    class UsersController < Subscribem::Account::BaseController
      before_action :authorize_owner!

      def index; end

      def destroy
        user = Subscribem::User.find(params[:id])
        current_account.users.delete(user)
        flash[:notice] = "#{user.email} has been removed from this account."
        redirect_to users_path
      end
    end
  end
end
