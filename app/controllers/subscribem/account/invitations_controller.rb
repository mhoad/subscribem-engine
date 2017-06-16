# frozen_string_literal: true

require_dependency 'subscribem/application_controller'

module Subscribem
  class Account
    class InvitationsController < Subscribem::Account::BaseController
      skip_before_action :authenticate_user!, only: %i[accept accepted]
      before_action :authorize_owner!, except: %i[accept accepted]

      def new
        @invitation = Subscribem::Invitation.new
      end

      def create
        @invitation = current_account.invitations.new(invitation_params)
        @invitation.save
        Subscribem::InvitationMailer.invite(@invitation).deliver_now
        flash[:notice] = "#{@invitation.email} has been invited."
        redirect_to subscribem.root_url
      end

      def accept
        # @invitation = Subscribem::Invitation.find(params[:id])
        # byebug
        @invitation = Subscribem::Invitation.find_by!(token: params[:id])
      end

      def accepted
        # @invitation = Subscribem::Invitation.find(params[:id])
        @invitation = Subscribem::Invitation.find_by!(token: params[:id])
        user_params = params[:user].permit(
          :email,
          :password,
          :password_confirmaiton
        )

        user = Subscribem::User.create!(user_params)
        current_account.users << user
        sign_in(user)

        flash[:notice] = "You have joined the #{current_account.name} account."
        redirect_to subscribem.root_url(subdomain: current_account.subdomain)
      end

      private

      def invitation_params
        params.require(:invitation).permit(:email)
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
