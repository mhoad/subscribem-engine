# frozen_string_literal: true

ActiveRecord::Base.class_eval do
  def self.scoped_to_account
    belongs_to :account, class_name: 'Subscribem::Account'
    association_name = to_s.downcase.pluralize.parameterize.underscore.to_sym
    Subscribem::Account.has_many association_name, class_name: to_s
  end
end
