# frozen_string_literal: true

# AddAuthorReferenceToBooks
class AddAuthorReferenceToBooks < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :author, null: false, foreign_key: true
  end
end
