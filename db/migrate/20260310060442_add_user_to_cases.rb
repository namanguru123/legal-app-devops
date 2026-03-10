class AddUserToCases < ActiveRecord::Migration[8.1]
  def change
    add_reference :cases, :user, null: false, foreign_key: true
  end
end
