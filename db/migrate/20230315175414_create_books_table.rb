# frozen_string_literal: true

# CreateBooksTable
class CreateBooksTable < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.date :release_date

      t.timestamps
    end
  end
end
