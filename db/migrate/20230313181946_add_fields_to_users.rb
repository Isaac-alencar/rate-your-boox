# frozen_string_literal: true

# AddFieldsToUser
class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, null: false, limit: 15, default: ''
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birthdate, :datetime
    add_column :users, :bio, :text, limit: 120
  end
end
