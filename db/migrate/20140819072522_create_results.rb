class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.text :result_data
      t.references :project, index: true

      t.timestamps
    end
  end
end
