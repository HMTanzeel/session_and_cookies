class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :year_published
      t.string :ISBN
      t.decimal :price
      t.boolean :out_of_print
      t.integer :views
      t.belongs_to :supplier, null: false, foreign_key: true
      t.belongs_to :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
