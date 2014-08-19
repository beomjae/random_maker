class CreateItemData < ActiveRecord::Migration
  def change
    create_table :item_data do |t|
      t.text :data
      t.references :item, index: true

      t.timestamps
    end
  end
end
