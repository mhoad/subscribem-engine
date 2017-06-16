# frozen_string_literal: true

require_dependency 'subscribem/application_controller'

module Subscribem
  class Account
    class InvitationsController < Subscribem::Account::BaseController
      before_action :authorize_owner!

      def new
        @invitation = Subscribem::Invitation.new
      end

      def create
        @invitation = current_account.invitations.new(invitation_params)
        @invitation.save
        flash[:notice] = "#{@invitation.email} has been invited."
        redirect_to subscribem.root_url
      end

      private

      def invitation_params
        params.require(:invitation).permit(:email, :account)
      end

      def authorize_owner!
        unless owner?
          flash[:alert] = 'Only an owner of an account can do that.'
          redirect_to subscribem.root_url(subdomain: current_account.subdomain)
        end
      end
    end
  end
end
