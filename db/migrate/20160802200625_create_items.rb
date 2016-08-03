class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.string :status
      t.integer :seller_id
      t.integer :category_id
      t.integer :price_cents, default: 0, null: false
      t.string :price_currency, default: "USD", null: false

      t.timestamps
    end
  end
end
