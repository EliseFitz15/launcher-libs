class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.integer :story_id, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
