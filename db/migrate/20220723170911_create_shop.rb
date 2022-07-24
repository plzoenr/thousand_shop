class CreateShop < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.references :category
      t.string :name, null: false
      # t.decimal :latitude ,precision: 15, scale: 6
      # t.decimal :longitude ,precision: 15, scale: 6
      t.string :latitude
      t.string :longitude
      t.timestamps
    end
  end
end
