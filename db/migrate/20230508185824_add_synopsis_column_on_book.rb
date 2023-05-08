class AddSynopsisColumnOnBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :synopsis, :string
  end
end
