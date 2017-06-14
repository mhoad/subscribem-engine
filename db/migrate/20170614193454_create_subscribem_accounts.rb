# frozen_string_literal: true

class CreateSubscribemAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribem_accounts do |t|
      t.string :name

      t.timestamps
    end
  end
end
