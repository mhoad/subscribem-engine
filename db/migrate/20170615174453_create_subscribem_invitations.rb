class CreateSubscribemInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribem_invitations do |t|
      t.string :email
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
