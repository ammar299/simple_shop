class CreateStoreProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :store_products do |t|
      t.references :store
      t.references :product

      t.timestamps
    end
  end
end
