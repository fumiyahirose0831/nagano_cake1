class CreateOderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :oder_details do |t|
     t.integer :order_id
     t.integer :item_id
     t.integer :price
     t.integer :amount
     t.datetime :created_at
     t.datetime :updated_at
      t.timestamps
    end
  end
end
