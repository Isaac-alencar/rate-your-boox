class CreateBookGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :book_genres do |t|
      t.references :book, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.string :kind, null: false

      t.timestamps
    end
  end
end
