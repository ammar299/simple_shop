class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image
      t.integer :price
      t.integer :sku
      t.integer :stock_id
      t.integer :region_id

      t.timestamps
    end
  end
end
