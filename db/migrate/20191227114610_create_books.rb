class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :rate
      t.string :author
      t.references :shelf, foreign_key: true

      t.timestamps
    end
  end
end
