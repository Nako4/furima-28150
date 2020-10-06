class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :text, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :who_pays_fare_id, null:false
      t.integer :consignor_id, null: false
      t.integer :when_ship_id, null: false
      t.integer :price, null: false
      t.integer :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
