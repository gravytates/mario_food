class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.string :country_origin

      t.timestamps
    end

    create_table :reviews do |r|
      r.string :author
      r.string :content_body
      r.integer :rating
      r.integer :product_id

      r.timestamps
    end
  end
end
