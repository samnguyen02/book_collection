# frozen_string_literal: true

class AddAuthorIdToBooks < ActiveRecord::Migration[8.0]
  def change
    add_reference :books, :author, foreign_key: true
    remove_column :books, :author, :string
  end
end
