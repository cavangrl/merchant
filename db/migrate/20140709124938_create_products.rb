class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.text :description
      t.string :image_url
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
