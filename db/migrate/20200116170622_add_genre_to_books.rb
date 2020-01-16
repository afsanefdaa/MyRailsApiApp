class AddGenreToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :genre, :string
    add_column :books, :publisher, :string
  end
end
