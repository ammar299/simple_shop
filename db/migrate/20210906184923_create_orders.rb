class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.text :shipping_address
      t.text :summary

      t.timestamps
    end
  end
end
