# frozen_string_literal: true

# CreateBooksTable
class CreateBooksTable < ActiveRecord::Migration[7.0]
  def change
    create_table :books_tables do |t|
      t.string :title, null: false
      t.date :release_date
      t.references :authors

      t.timestamps
    end
  end
end
