# frozen_string_literal: true

class ChangeColumnToPost < ActiveRecord::Migration[5.2]
  def up
    change_column :posts, :title, :string, limit: 256, null: false
    change_column :posts, :body, :string, limit: 1024, null: false
  end

  def down
    change_column :posts, :title, :string
    change_column :posts, :body, :string
  end
end
