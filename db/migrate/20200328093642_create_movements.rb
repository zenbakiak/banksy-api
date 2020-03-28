# frozen_string_literal: true

class CreateMovements < ActiveRecord::Migration[6.0]
  def change
    create_table :movements do |t|
      t.references :sender,
                   null: false,
                   foreign_key: {
                     to_table: :users
                   }
      t.references :receiver,
                   null: false,
                   foreign_key: {
                     to_table: :users
                   }
      t.integer :amount
      t.string :ref
      t.string :concept

      t.timestamps
    end
  end
end
