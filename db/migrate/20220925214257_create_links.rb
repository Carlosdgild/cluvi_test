# frozen_string_literal: true

class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :url, null: false
      t.string :short_code, null: false, limit: 7
      t.integer :counter, null: false, default: 0
      t.integer :alexa_rank, null: false, default: 0

      t.timestamps
    end
    add_index :links, :short_code, unique: true
  end
end
