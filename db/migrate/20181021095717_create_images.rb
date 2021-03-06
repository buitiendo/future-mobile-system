class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :image_link
      t.references :product, foreign_key: true

      t.timestamps
    end
    add_index :images, [:product_id, :created_at]
  end
end
