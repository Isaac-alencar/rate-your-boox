# frozen_string_literal: true

# CreateAuthorsTable
class CreateAuthorsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name, null: false
      t.date :birthdate
      t.string :also_known_as, array: true

      t.timestamps
    end
  end
end
