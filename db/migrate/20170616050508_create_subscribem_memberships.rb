class CreateSubscribemMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribem_memberships do |t|
      t.references :account, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
