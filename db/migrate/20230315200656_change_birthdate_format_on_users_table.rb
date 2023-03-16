# frozen_string_literal: true

# ChangeBirthdateFormatOnUsersTable
class ChangeBirthdateFormatOnUsersTable < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :birthdate, :date
  end
end
