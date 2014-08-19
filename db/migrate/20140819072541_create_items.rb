class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.references :item_type, index: true
      t.references :project, index: true

      t.timestamps
    end
  end
end
