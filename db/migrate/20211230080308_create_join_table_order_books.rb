class CreateJoinTableOrderBooks < ActiveRecord::Migration[7.0]
  def change
    create_join_table :orders, :books do |t|
      t.references :orders, null: false, foreign_key: true
      t.references :books, null: false, foreign_key: true
    end
  end
end
