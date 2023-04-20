# frozen_string_literal: true

# CreateReview
class CreateReview < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :description
      t.string :attribuition
      t.references :rating, null: false, foreign_key: true

      t.timestamps
    end
  end
end
