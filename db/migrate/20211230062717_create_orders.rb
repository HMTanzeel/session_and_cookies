class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.datetime :date_submitted
      t.integer :status
      t.decimal :subtotal
      t.decimal :shipping
      t.decimal :tax
      t.decimal :total
      t.belongs_to :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
