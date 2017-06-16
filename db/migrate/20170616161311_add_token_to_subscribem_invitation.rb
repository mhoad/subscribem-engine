class AddTokenToSubscribemInvitation < ActiveRecord::Migration[5.1]
  def change
    add_column :subscribem_invitations, :token, :string
    add_index :subscribem_invitations, :token, unique: true
  end
end
