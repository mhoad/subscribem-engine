# frozen_string_literal: true

module Subscribem
  class InvitationMailer < ApplicationMailer
    def invite(invitation)
      @invitation = invitation
      mail(
        to: invitation.email,
        subject: "You have been invited to the #{invitation.account.name} account"
      )
    end
  end
end
