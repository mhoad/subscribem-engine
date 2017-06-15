class AddSubdomainToSubscribemAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :subscribem_accounts, :subdomain, :string
    add_index :subscribem_accounts, :subdomain
  end
end
