class CreateWidgets < ActiveRecord::Migration[5.1]
  def change
    create_table :widgets do |t|
      t.string :name
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
