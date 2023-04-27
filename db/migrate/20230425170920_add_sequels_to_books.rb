class AddSequelsToBooks < ActiveRecord::Migration[7.0]
  def change
    change_table :books do |t|
      t.references :sequence, foreign_key: { to_table: :books }
    end
  end
end
