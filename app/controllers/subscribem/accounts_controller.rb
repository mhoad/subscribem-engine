# frozen_string_literal: true

require_dependency 'subscribem/application_controller'

module Subscribem
  class AccountsController < ApplicationController
    def new
      @account = Subscribem::Account.new
      @account.build_owner
    end

    def create
      @account = Subscribem::Account.create(account_params)
      if @account.save
        sign_in(@account.owner)
        flash[:notice] = 'Your account has been successfully created.'
        redirect_to subscribem.root_url(subdomain: @account.subdomain)
      else
        flash.now[:alert] = 'Sorry, your account could not be created.'
        render :new
      end
    end

    private

    def account_params
      params.require(:account).permit(:name, :subdomain,
                                      owner_attributes: %i[
                                        email password password_confirmation
                                      ])
    end
  end
end
