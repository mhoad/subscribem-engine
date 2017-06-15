class AddOwnerIdToSubscribemAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :subscribem_accounts, :owner_id, :integer
  end
end
