# frozen_string_literal: true

class AddAdminFieldToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :admin, :boolean, default: false
  end
end
