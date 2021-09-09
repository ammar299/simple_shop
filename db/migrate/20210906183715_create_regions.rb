class CreateRegions < ActiveRecord::Migration[6.0]
  def change
    create_table :regions do |t|
      t.string :title
      t.string :country_details
      t.string :currency_details
      t.string :tax_details

      t.timestamps
    end
  end
end
