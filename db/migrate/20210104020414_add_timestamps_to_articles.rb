# frozen_string_literal: true

class AddTimestampsToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :description, :text
  end
end
